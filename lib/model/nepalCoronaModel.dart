// To parse this JSON data, do
//
//     final coronaSummary = coronaSummaryFromJson(jsonString);

import 'dart:convert';

CoronaSummary coronaSummaryFromJson(String str) => CoronaSummary.fromJson(json.decode(str));

String coronaSummaryToJson(CoronaSummary data) => json.encode(data.toJson());

class CoronaSummary {
    CoronaSummary({
        this.total,
        this.currentState,
        this.province,
        this.district,
        this.municipality,
        this.gender,
        this.type,
        this.ageGroup,
    });

    int total;
    List<CurrentState> currentState;
    Province province;
    District district;
    Municipality municipality;
    Gender gender;
    Type type;
    AgeGroup ageGroup;

    factory CoronaSummary.fromJson(Map<String, dynamic> json) => CoronaSummary(
        total: json["total"],
        currentState: List<CurrentState>.from(json["current_state"].map((x) => CurrentState.fromJson(x))),
        province: Province.fromJson(json["province"]),
        district: District.fromJson(json["district"]),
        municipality: Municipality.fromJson(json["municipality"]),
        gender: Gender.fromJson(json["gender"]),
        type: Type.fromJson(json["type"]),
        ageGroup: AgeGroup.fromJson(json["age_group"]),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "current_state": List<dynamic>.from(currentState.map((x) => x.toJson())),
        "province": province.toJson(),
        "district": district.toJson(),
        "municipality": municipality.toJson(),
        "gender": gender.toJson(),
        "type": type.toJson(),
        "age_group": ageGroup.toJson(),
    };
}

class AgeGroup {
    AgeGroup({
        this.cases,
        this.active,
        this.recovered,
        this.deaths,
    });

    List<AgeGroupActive> cases;
    List<AgeGroupActive> active;
    List<AgeGroupActive> recovered;
    List<AgeGroupActive> deaths;

    factory AgeGroup.fromJson(Map<String, dynamic> json) => AgeGroup(
        cases: List<AgeGroupActive>.from(json["cases"].map((x) => AgeGroupActive.fromJson(x))),
        active: List<AgeGroupActive>.from(json["active"].map((x) => AgeGroupActive.fromJson(x))),
        recovered: List<AgeGroupActive>.from(json["recovered"].map((x) => AgeGroupActive.fromJson(x))),
        deaths: List<AgeGroupActive>.from(json["deaths"].map((x) => AgeGroupActive.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cases": List<dynamic>.from(cases.map((x) => x.toJson())),
        "active": List<dynamic>.from(active.map((x) => x.toJson())),
        "recovered": List<dynamic>.from(recovered.map((x) => x.toJson())),
        "deaths": List<dynamic>.from(deaths.map((x) => x.toJson())),
    };
}

class AgeGroupActive {
    AgeGroupActive({
        this.count,
        this.age,
    });

    int count;
    String age;

    factory AgeGroupActive.fromJson(Map<String, dynamic> json) => AgeGroupActive(
        count: json["count"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "age": age,
    };
}

class CurrentState {
    CurrentState({
        this.count,
        this.currentState,
    });

    int count;
    String currentState;

    factory CurrentState.fromJson(Map<String, dynamic> json) => CurrentState(
        count: json["count"],
        currentState: json["currentState"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "currentState": currentState,
    };
}

class District {
    District({
        this.cases,
        this.active,
        this.recovered,
        this.deaths,
    });

    List<DistrictActive> cases;
    List<DistrictActive> active;
    List<DistrictActive> recovered;
    List<DistrictActive> deaths;

    factory District.fromJson(Map<String, dynamic> json) => District(
        cases: List<DistrictActive>.from(json["cases"].map((x) => DistrictActive.fromJson(x))),
        active: List<DistrictActive>.from(json["active"].map((x) => DistrictActive.fromJson(x))),
        recovered: List<DistrictActive>.from(json["recovered"].map((x) => DistrictActive.fromJson(x))),
        deaths: List<DistrictActive>.from(json["deaths"].map((x) => DistrictActive.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cases": List<dynamic>.from(cases.map((x) => x.toJson())),
        "active": List<dynamic>.from(active.map((x) => x.toJson())),
        "recovered": List<dynamic>.from(recovered.map((x) => x.toJson())),
        "deaths": List<dynamic>.from(deaths.map((x) => x.toJson())),
    };
}

class DistrictActive {
    DistrictActive({
        this.count,
        this.district,
    });

    int count;
    int district;

    factory DistrictActive.fromJson(Map<String, dynamic> json) => DistrictActive(
        count: json["count"],
        district: json["district"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "district": district,
    };
}

class Gender {
    Gender({
        this.cases,
        this.active,
        this.recovered,
        this.deaths,
    });

    List<GenderActive> cases;
    List<GenderActive> active;
    List<GenderActive> recovered;
    List<GenderActive> deaths;

    factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        cases: List<GenderActive>.from(json["cases"].map((x) => GenderActive.fromJson(x))),
        active: List<GenderActive>.from(json["active"].map((x) => GenderActive.fromJson(x))),
        recovered: List<GenderActive>.from(json["recovered"].map((x) => GenderActive.fromJson(x))),
        deaths: List<GenderActive>.from(json["deaths"].map((x) => GenderActive.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cases": List<dynamic>.from(cases.map((x) => x.toJson())),
        "active": List<dynamic>.from(active.map((x) => x.toJson())),
        "recovered": List<dynamic>.from(recovered.map((x) => x.toJson())),
        "deaths": List<dynamic>.from(deaths.map((x) => x.toJson())),
    };
}

class GenderActive {
    GenderActive({
        this.count,
        this.gender,
    });

    int count;
    String gender;

    factory GenderActive.fromJson(Map<String, dynamic> json) => GenderActive(
        count: json["count"],
        gender: json["gender"] == null ? null : json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "gender": gender == null ? null : gender,
    };
}

class Municipality {
    Municipality({
        this.cases,
        this.active,
        this.recovered,
        this.deaths,
    });

    List<MunicipalityActive> cases;
    List<MunicipalityActive> active;
    List<MunicipalityActive> recovered;
    List<MunicipalityActive> deaths;

    factory Municipality.fromJson(Map<String, dynamic> json) => Municipality(
        cases: List<MunicipalityActive>.from(json["cases"].map((x) => MunicipalityActive.fromJson(x))),
        active: List<MunicipalityActive>.from(json["active"].map((x) => MunicipalityActive.fromJson(x))),
        recovered: List<MunicipalityActive>.from(json["recovered"].map((x) => MunicipalityActive.fromJson(x))),
        deaths: List<MunicipalityActive>.from(json["deaths"].map((x) => MunicipalityActive.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cases": List<dynamic>.from(cases.map((x) => x.toJson())),
        "active": List<dynamic>.from(active.map((x) => x.toJson())),
        "recovered": List<dynamic>.from(recovered.map((x) => x.toJson())),
        "deaths": List<dynamic>.from(deaths.map((x) => x.toJson())),
    };
}

class MunicipalityActive {
    MunicipalityActive({
        this.count,
        this.municipality,
    });

    int count;
    int municipality;

    factory MunicipalityActive.fromJson(Map<String, dynamic> json) => MunicipalityActive(
        count: json["count"],
        municipality: json["municipality"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "municipality": municipality,
    };
}

class Province {
    Province({
        this.cases,
        this.active,
        this.recovered,
        this.deaths,
    });

    List<ProvinceActive> cases;
    List<ProvinceActive> active;
    List<ProvinceActive> recovered;
    List<ProvinceActive> deaths;

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        cases: List<ProvinceActive>.from(json["cases"].map((x) => ProvinceActive.fromJson(x))),
        active: List<ProvinceActive>.from(json["active"].map((x) => ProvinceActive.fromJson(x))),
        recovered: List<ProvinceActive>.from(json["recovered"].map((x) => ProvinceActive.fromJson(x))),
        deaths: List<ProvinceActive>.from(json["deaths"].map((x) => ProvinceActive.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cases": List<dynamic>.from(cases.map((x) => x.toJson())),
        "active": List<dynamic>.from(active.map((x) => x.toJson())),
        "recovered": List<dynamic>.from(recovered.map((x) => x.toJson())),
        "deaths": List<dynamic>.from(deaths.map((x) => x.toJson())),
    };
}

class ProvinceActive {
    ProvinceActive({
        this.count,
        this.province,
    });

    int count;
    int province;

    factory ProvinceActive.fromJson(Map<String, dynamic> json) => ProvinceActive(
        count: json["count"],
        province: json["province"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "province": province,
    };
}

class Type {
    Type({
        this.cases,
        this.active,
        this.recovered,
        this.deaths,
    });

    List<TypeActive> cases;
    List<TypeActive> active;
    List<TypeActive> recovered;
    List<TypeActive> deaths;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        cases: List<TypeActive>.from(json["cases"].map((x) => TypeActive.fromJson(x))),
        active: List<TypeActive>.from(json["active"].map((x) => TypeActive.fromJson(x))),
        recovered: List<TypeActive>.from(json["recovered"].map((x) => TypeActive.fromJson(x))),
        deaths: List<TypeActive>.from(json["deaths"].map((x) => TypeActive.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cases": List<dynamic>.from(cases.map((x) => x.toJson())),
        "active": List<dynamic>.from(active.map((x) => x.toJson())),
        "recovered": List<dynamic>.from(recovered.map((x) => x.toJson())),
        "deaths": List<dynamic>.from(deaths.map((x) => x.toJson())),
    };
}

class TypeActive {
    TypeActive({
        this.count,
        this.type,
    });

    int count;
    String type;

    factory TypeActive.fromJson(Map<String, dynamic> json) => TypeActive(
        count: json["count"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "type": type == null ? null : type,
    };
}
