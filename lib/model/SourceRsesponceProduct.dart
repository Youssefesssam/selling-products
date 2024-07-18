import 'dart:convert';

int asInt(Map<String, dynamic>? json, String key) {
  return json?[key] ?? 0;
}

String asString(Map<String, dynamic>? json, String key) {
  return json?[key] ?? '';
}

double asDouble(Map<String, dynamic>? json, String key) {
  var value = json?[key];
  if (value is int) {
    return value.toDouble();
  }
  return value ?? 0.0;
}

List<dynamic> asList(Map<String, dynamic>? json, String key) {
  return json?[key] ?? [];
}

Map<String, dynamic> asMap(Map<String, dynamic>? json, String key) {
  return json?[key] ?? {};
}

class SourceResponseProduct {
  final List<ProductsItem> products;
  final int total;
  final int skip;
  final int limit;

  SourceResponseProduct({
    required this.products,
    this.total = 0,
    this.skip = 0,
    this.limit = 0,
  });

  factory SourceResponseProduct.fromJson(Map<String, dynamic>? json) => SourceResponseProduct(
    products: asList(json, 'products').map((e) => ProductsItem.fromJson(e)).toList(),
    total: asInt(json, 'total'),
    skip: asInt(json, 'skip'),
    limit: asInt(json, 'limit'),
  );

  Map<String, dynamic> toJson() => {
    'products': products.map((e) => e.toJson()).toList(),
    'total': total,
    'skip': skip,
    'limit': limit,
  };
}

class ProductsItem {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewsItem> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  ProductsItem({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.category = "",
    this.price = 0.0,
    this.discountPercentage = 0.0,
    this.rating = 0.0,
    this.stock = 0,
    required this.tags,
    this.brand = "",
    this.sku = "",
    this.weight = 0,
    required this.dimensions,
    this.warrantyInformation = "",
    this.shippingInformation = "",
    this.availabilityStatus = "",
    required this.reviews,
    this.returnPolicy = "",
    this.minimumOrderQuantity = 0,
    required this.meta,
    required this.images,
    this.thumbnail = "",
  });

  factory ProductsItem.fromJson(Map<String, dynamic>? json) => ProductsItem(
    id: asInt(json, 'id'),
    title: asString(json, 'title'),
    description: asString(json, 'description'),
    category: asString(json, 'category'),
    price: asDouble(json, 'price'),
    discountPercentage: asDouble(json, 'discountPercentage'),
    rating: asDouble(json, 'rating'),
    stock: asInt(json, 'stock'),
    tags: asList(json, 'tags').map((e) => e.toString()).toList(),
    brand: asString(json, 'brand'),
    sku: asString(json, 'sku'),
    weight: asInt(json, 'weight'),
    dimensions: Dimensions.fromJson(asMap(json, 'dimensions')),
    warrantyInformation: asString(json, 'warrantyInformation'),
    shippingInformation: asString(json, 'shippingInformation'),
    availabilityStatus: asString(json, 'availabilityStatus'),
    reviews: asList(json, 'reviews').map((e) => ReviewsItem.fromJson(e)).toList(),
    returnPolicy: asString(json, 'returnPolicy'),
    minimumOrderQuantity: asInt(json, 'minimumOrderQuantity'),
    meta: Meta.fromJson(asMap(json, 'meta')),
    images: asList(json, 'images').map((e) => e.toString()).toList(),
    thumbnail: asString(json, 'thumbnail'),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'category': category,
    'price': price,
    'discountPercentage': discountPercentage,
    'rating': rating,
    'stock': stock,
    'tags': tags.map((e) => e).toList(),
    'brand': brand,
    'sku': sku,
    'weight': weight,
    'dimensions': dimensions.toJson(),
    'warrantyInformation': warrantyInformation,
    'shippingInformation': shippingInformation,
    'availabilityStatus': availabilityStatus,
    'reviews': reviews.map((e) => e.toJson()).toList(),
    'returnPolicy': returnPolicy,
    'minimumOrderQuantity': minimumOrderQuantity,
    'meta': meta.toJson(),
    'images': images.map((e) => e).toList(),
    'thumbnail': thumbnail,
  };
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    this.width = 0.0,
    this.height = 0.0,
    this.depth = 0.0,
  });

  factory Dimensions.fromJson(Map<String, dynamic>? json) => Dimensions(
    width: asDouble(json, 'width'),
    height: asDouble(json, 'height'),
    depth: asDouble(json, 'depth'),
  );

  Map<String, dynamic> toJson() => {
    'width': width,
    'height': height,
    'depth': depth,
  };
}

class ReviewsItem {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  ReviewsItem({
    this.rating = 0,
    this.comment = "",
    this.date = "",
    this.reviewerName = "",
    this.reviewerEmail = "",
  });

  factory ReviewsItem.fromJson(Map<String, dynamic>? json) => ReviewsItem(
    rating: asInt(json, 'rating'),
    comment: asString(json, 'comment'),
    date: asString(json, 'date'),
    reviewerName: asString(json, 'reviewerName'),
    reviewerEmail: asString(json, 'reviewerEmail'),
  );

  Map<String, dynamic> toJson() => {
    'rating': rating,
    'comment': comment,
    'date': date,
    'reviewerName': reviewerName,
    'reviewerEmail': reviewerEmail,
  };
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    this.createdAt = "",
    this.updatedAt = "",
    this.barcode = "",
    this.qrCode = "",
  });

  factory Meta.fromJson(Map<String, dynamic>? json) => Meta(
    createdAt: asString(json, 'createdAt'),
    updatedAt: asString(json, 'updatedAt'),
    barcode: asString(json, 'barcode'),
    qrCode: asString(json, 'qrCode'),
  );

  Map<String, dynamic> toJson() => {
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'barcode': barcode,
    'qrCode': qrCode,
  };
}
