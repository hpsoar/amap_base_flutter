import 'package:amap_base/amap_base.dart';
import 'package:amap_base/src/search/model/district_result.dart';

class DistrictResultAndroid {
  List<DistrictInfoAndroid> district;
  int pageCount;

  DistrictResultAndroid({
    this.district,
    this.pageCount,
  });

  DistrictResultAndroid.fromJson(Map<String, dynamic> json) {
    if (json['district'] != null) {
      district = new List<DistrictInfoAndroid>();
      json['district'].forEach((v) {
        district.add(new DistrictInfoAndroid.fromJson(v));
      });
    }
    pageCount = json['pageCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.district != null) {
      data['district'] = this.district.map((v) => v.toJson()).toList();
    }
    data['pageCount'] = this.pageCount;
    return data;
  }
}

class DistrictInfoAndroid {
  String adcode;
  LatLng center;
  String citycode;
  String level;
  String name;
  List<DistrictInfoAndroid> subDistrict;

  DistrictInfoAndroid(
      {this.adcode,
      this.center,
      this.citycode,
      this.level,
      this.name,
      this.subDistrict});

  DistrictInfoAndroid.fromJson(Map<String, dynamic> json) {
    adcode = json['adcode'];
    center =
        json['center'] != null ? new LatLng.fromJson(json['center']) : null;
    citycode = json['citycode'];
    level = json['level'];
    name = json['name'];
    if (json['subDistrict'] != null) {
      subDistrict = new List<DistrictInfoAndroid>();
      json['subDistrict'].forEach((v) {
        subDistrict.add(new DistrictInfoAndroid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adcode'] = this.adcode;
    if (this.center != null) {
      data['center'] = this.center.toJson();
    }
    data['citycode'] = this.citycode;
    data['level'] = this.level;
    data['name'] = this.name;
    if (this.subDistrict != null) {
      data['subDistrict'] = this.subDistrict.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

DistrictResult convertDistrictResult(DistrictResultAndroid an) {
  final d = DistrictResult(
      count: an.district?.length ?? 0,
      districts: convertDistrictInfo(an.district));
  return d;
}

List<DistrictInfo> convertDistrictInfo(List<DistrictInfoAndroid> an) {
  return (an ?? [])
      .map((d) => DistrictInfo(
            adcode: d.adcode,
            name: d.name,
            level: d.level,
            center: d.center,
            districts: convertDistrictInfo(d.subDistrict),
          ))
      .toList();
}
