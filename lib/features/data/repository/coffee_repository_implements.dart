import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/data/models/organizations_model.dart';
import 'package:cofee/features/data/models/products/products_model.dart';
import 'package:cofee/features/data/models/token_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';
import 'package:cofee/features/domain/entiti/organizations_entiti.dart';
import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:cofee/features/domain/entiti/token_entiti.dart';
import 'package:cofee/features/domain/entiti/user_id_entiti.dart';
import 'package:cofee/core/error/failure.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;

  CoffeeRepositoryImpl(this.remoteDatasource, this.localDatasource);
  @override
  Future<Either<Failure, UserIdEntiti>> createUser(
      String endpoint, String phone, String organizationId) async {
    return await _createUser(
      () => remoteDatasource.createUser(endpoint, phone, organizationId),
      phone,
    );
  }

  Future<Either<Failure, UserIdModel>> _createUser(
      Future<UserIdModel> Function() user, String phone) async {
    try {
      final userModel = await user();
      localDatasource.saveUserId(userModel);
      localDatasource.savePhoneUser(phone);
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizationsEntiti>> getOrganization(
    List<String> organizationIds,
    bool returnAdditionalInfo,
    bool includeDisabled,
    String endpoint,
  ) async {
    return await _getOrganization(() => remoteDatasource.getOrganizations(
        organizationIds, returnAdditionalInfo, includeDisabled, endpoint));
  }

  Future<Either<Failure, OrganizationsModel>> _getOrganization(
      Future<OrganizationsModel> Function() organization) async {
    try {
      final organizationModel = await organization();
      return Right(organizationModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TokenEntiti>> getToken(String endpoint) async {
    return await _getToken(() => remoteDatasource.getToken(endpoint));
  }

  Future<Either<Failure, TokenModel>> _getToken(
      Future<TokenModel> Function() token) async {
    try {
      final tokenModel = await token();
      localDatasource.saveToken(tokenModel.token);
      return Right(tokenModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductsEntiti>> getProducts(String endpoint) async {
    return await _getProducts(() => remoteDatasource.getProducts(endpoint));
  }

  Future<Either<Failure, ProductsModel>> _getProducts(
      Future<ProductsModel> Function() products) async {
    try {
      final productsModel = await products();
      return Right(productsModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}