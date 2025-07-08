
class UserModel {
  final int? id;
  final String? fullName;
  final String? emailAddres;
  final List<String>? rolesNames;
  final List<String>? permissionsNames;
  final String? accessToken;
  final dynamic jobTitleName;
  final dynamic userPhotoUrl;
  final bool? enforceChangePasswordNextLogin;

  UserModel({
    this.id,
    this.fullName,
    this.emailAddres,
    this.rolesNames,
    this.permissionsNames,
    this.accessToken,
    this.jobTitleName,
    this.userPhotoUrl,
    this.enforceChangePasswordNextLogin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    fullName: json["fullName"],
    emailAddres: json["emailAddres"],
    rolesNames: json["rolesNames"] == null ? [] : List<String>.from(json["rolesNames"]!.map((x) => x)),
    permissionsNames: json["permissionsNames"] == null ? [] : List<String>.from(json["permissionsNames"]!.map((x) => x)),
    accessToken: json["accessToken"],
    jobTitleName: json["jobTitleName"],
    userPhotoUrl: json["userPhotoUrl"],
    enforceChangePasswordNextLogin: json["enforceChangePasswordNextLogin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "emailAddres": emailAddres,
    "rolesNames": rolesNames == null ? [] : List<dynamic>.from(rolesNames!.map((x) => x)),
    "permissionsNames": permissionsNames == null ? [] : List<dynamic>.from(permissionsNames!.map((x) => x)),
    "accessToken": accessToken,
    "jobTitleName": jobTitleName,
    "userPhotoUrl": userPhotoUrl,
    "enforceChangePasswordNextLogin": enforceChangePasswordNextLogin,
  };
}
