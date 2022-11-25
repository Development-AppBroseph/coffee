import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/auth/presentation/data/models/organizations_model.dart';
import 'package:cofee/features/auth/presentation/data/models/token_model.dart';
import 'package:cofee/features/auth/presentation/data/models/user_id_model.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/organizations_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/token_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/user_id_entiti.dart';
import 'package:cofee/core/error/failure.dart';
import 'package:cofee/features/auth/presentation/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final RemoteDatasource remoteDatasource;

  CoffeeRepositoryImpl(this.remoteDatasource);
  @override
  Future<Either<Failure, UserIdEntiti>> createUser(
      String endpoint, String phone, String organizationId) async {
    return await _createUser(
      () => remoteDatasource.createUser(endpoint, phone, organizationId),
    );
  }

  Future<Either<Failure, UserIdModel>> _createUser(
      Future<UserIdModel> Function() user) async {
    try {
      final userModel = await user();
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
      return Right(tokenModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
