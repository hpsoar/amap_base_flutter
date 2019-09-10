import 'package:amap_base_core/amap_base_core.dart';

class DistrictSearchResult {
	int count;
	List<DistrictInfo> districts;

	DistrictSearchResult({this.count, this.districts});

	DistrictSearchResult.fromJson(Map<String, dynamic> json) {
		count = json['count'];
		if (json['districts'] != null) {
			districts = new List<DistrictInfo>();
			json['districts'].forEach((v) { districts.add(new DistrictInfo.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		if (this.districts != null) {
      data['districts'] = this.districts.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class DistrictInfo {
	String citycode;
	LatLng center;
	List<DistrictInfo> districts;
	String level;
	String name;
	String adcode;

	DistrictInfo({this.citycode, this.center, this.districts, this.level, this.name, this.adcode});

	DistrictInfo.fromJson(Map<String, dynamic> json) {
		citycode = json['citycode'];
		center = json['center'] != null ? new LatLng.fromJson(json['center']) : null;
		if (json['districts'] != null) {
			districts = new List<DistrictInfo>();
			json['districts'].forEach((v) { districts.add(new DistrictInfo.fromJson(v)); });
		}
		level = json['level'];
		name = json['name'];
		adcode = json['adcode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['citycode'] = this.citycode;
		if (this.center != null) {
      data['center'] = this.center.toJson();
    }
		if (this.districts != null) {
      data['districts'] = this.districts.map((v) => v.toJson()).toList();
    }
		data['level'] = this.level;
		data['name'] = this.name;
		data['adcode'] = this.adcode;
		return data;
	}
}

