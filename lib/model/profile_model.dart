class ProfileModel {
  String? address;
  double? balance;
  String? city;
  String? country;
  int? currency;
  int? currentTradesCount;
  double? currentTradesVolume;
  double? equity;
  double? freeMargin;
  bool? isAnyOpenTrades;
  bool? isSwapFree;
  int? leverage;
  String? name;
  String? phone;
  int? totalTradesCount;
  double? totalTradesVolume;
  int? type;
  int? verificationLevel;
  String? zipCode;

  ProfileModel(
      {this.address,
        this.balance,
        this.city,
        this.country,
        this.currency,
        this.currentTradesCount,
        this.currentTradesVolume,
        this.equity,
        this.freeMargin,
        this.isAnyOpenTrades,
        this.isSwapFree,
        this.leverage,
        this.name,
        this.phone,
        this.totalTradesCount,
        this.totalTradesVolume,
        this.type,
        this.verificationLevel,
        this.zipCode});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    balance = json['balance'];
    city = json['city'];
    country = json['country'];
    currency = json['currency'];
    currentTradesCount = json['currentTradesCount'];
    currentTradesVolume = json['currentTradesVolume'];
    equity = json['equity'];
    freeMargin = json['freeMargin'];
    isAnyOpenTrades = json['isAnyOpenTrades'];
    isSwapFree = json['isSwapFree'];
    leverage = json['leverage'];
    name = json['name'];
    phone = json['phone'];
    totalTradesCount = json['totalTradesCount'];
    totalTradesVolume = json['totalTradesVolume'];
    type = json['type'];
    verificationLevel = json['verificationLevel'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['balance'] = this.balance;
    data['city'] = this.city;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['currentTradesCount'] = this.currentTradesCount;
    data['currentTradesVolume'] = this.currentTradesVolume;
    data['equity'] = this.equity;
    data['freeMargin'] = this.freeMargin;
    data['isAnyOpenTrades'] = this.isAnyOpenTrades;
    data['isSwapFree'] = this.isSwapFree;
    data['leverage'] = this.leverage;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['totalTradesCount'] = this.totalTradesCount;
    data['totalTradesVolume'] = this.totalTradesVolume;
    data['type'] = this.type;
    data['verificationLevel'] = this.verificationLevel;
    data['zipCode'] = this.zipCode;
    return data;
  }
}







