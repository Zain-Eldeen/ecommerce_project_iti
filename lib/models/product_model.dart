
class ProductsModel {
  ProductsModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Product> products;
  final int? total;
  final int? skip;
  final int? limit;

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      products: (json["products"] as List<dynamic>?)
              ?.map((item) => Product.fromJson(item))
              .toList() ??
          [],
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "products": products.map((product) => product.toJson()).toList(),
      "total": total,
      "skip": skip,
      "limit": limit,
    };
  }
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
    this.isFavorite = false, // Default favorite status
  });

  final int id;
  final String title;
  final String? description;
  final String? category;
  final double price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String> tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review> reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String> images;
  final String thumbnail;
  bool isFavorite;

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      price: json["price"]?.toDouble() ?? 0.0,
      discountPercentage: json["discountPercentage"]?.toDouble(),
      rating: json["rating"]?.toDouble(),
      stock: json["stock"],
      tags: (json["tags"] as List<dynamic>?)
              ?.map((item) => item.toString())
              .toList() ??
          [],
      brand: json["brand"],
      sku: json["sku"],
      weight: json["weight"],
      dimensions: json["dimensions"] != null
          ? Dimensions.fromJson(json["dimensions"])
          : null,
      warrantyInformation: json["warrantyInformation"],
      shippingInformation: json["shippingInformation"],
      availabilityStatus: json["availabilityStatus"],
      reviews: (json["reviews"] as List<dynamic>?)
              ?.map((item) => Review.fromJson(item))
              .toList() ??
          [],
      returnPolicy: json["returnPolicy"],
      minimumOrderQuantity: json["minimumOrderQuantity"],
      meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
      images: (json["images"] as List<dynamic>?)
              ?.map((item) => item.toString())
              .toList() ??
          [],
      thumbnail: json["thumbnail"] ?? '',
      isFavorite: json["isFavorite"] ?? false, // Use value from JSON if available
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "tags": tags,
      "brand": brand,
      "sku": sku,
      "weight": weight,
      "dimensions": dimensions?.toJson(),
      "warrantyInformation": warrantyInformation,
      "shippingInformation": shippingInformation,
      "availabilityStatus": availabilityStatus,
      "reviews": reviews.map((review) => review.toJson()).toList(),
      "returnPolicy": returnPolicy,
      "minimumOrderQuantity": minimumOrderQuantity,
      "meta": meta?.toJson(),
      "images": images,
      "thumbnail": thumbnail,
      "isFavorite": isFavorite,
    };
  }
}

class Dimensions {
  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  final double? width;
  final double? height;
  final double? depth;

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json["width"]?.toDouble(),
      height: json["height"]?.toDouble(),
      depth: json["depth"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "width": width,
      "height": height,
      "depth": depth,
    };
  }
}

class Meta {
  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      barcode: json["barcode"],
      qrCode: json["qrCode"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "barcode": barcode,
      "qrCode": qrCode,
    };
  }
}

class Review {
  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json["rating"],
      comment: json["comment"],
      date: DateTime.tryParse(json["date"] ?? ""),
      reviewerName: json["reviewerName"],
      reviewerEmail: json["reviewerEmail"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rating": rating,
      "comment": comment,
      "date": date?.toIso8601String(),
      "reviewerName": reviewerName,
      "reviewerEmail": reviewerEmail,
    };
  }
}
