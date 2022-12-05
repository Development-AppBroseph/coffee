import 'package:cofee/features/data/models/organizations_model.dart';
import 'package:cofee/features/data/models/products/products_model.dart';
import 'package:cofee/features/data/models/token_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';

abstract class RemoteDatasource {
  Future<UserIdModel> createUser(
      String endpoint, String phoneNumber, String organizationId);
  Future<OrganizationsModel> getOrganizations(List<String> organizationIds,
      bool returnAdditionalInfo, bool includeDisabled, String endpoint);
  Future<TokenModel> getToken(String endpoint);    
  Future<ProductsModel> getProducts(String endpoint);
}