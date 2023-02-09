class Product {
  String id;
  String name;
  String description;
  String price;
  String image;
  String provider;
  List gallery;
  String department;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.provider,
    required this.gallery,
    required this.department,
  });

  factory Product.fromJson(Map<String, dynamic> json, String provider) {
    final item = Product(
        id: json['id'],
        name: json['nome'] ?? json['name'],
        description: json['descricao'] ?? json['description'],
        price: json['preco'] ?? json['price'],
        image: json['imagem'] ?? json['gallery'][0],
        gallery: json['gallery'] ?? [json['imagem']],
        department: json['departamento'] ?? '',
        provider: provider);

    if (item.image.contains('placeimg')) {
      item.image = item.image
          .replaceAll('http://placeimg.com', 'https://loremflickr.com');
    }

    return item;
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
