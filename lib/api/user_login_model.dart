class UserLoginModel{

  int? id;
  String? name;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserLoginModel(this.id, this.name, this.email, this.phone,
      this.emailVerifiedAt, this.createdAt, this.updatedAt);
  
  UserLoginModel.formMap(Map<String ,dynamic> map){
    
    id = map['id'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    emailVerifiedAt = map['email_verified_at'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
  }
  Map<String , dynamic>  toMap(){

    return{
      "id" : id,
      "name" :name,
      "email" :email,
      "phone" :phone,
      "email_verified_at" :emailVerifiedAt,
      "created_at":createdAt,
      "updated_at" :updatedAt



    };

  }
  
  
}