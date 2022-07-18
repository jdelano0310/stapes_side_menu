class LatestItem {
  final String row;
  final String date; // non-nullable
  final String title; // non-nullable
  final String subtitle; // non-nullable
  final String url; // non-nullable
  final String image; // non-nullable
  final String excerpt; // non-nullable

  LatestItem(this.row, this.date, this.title, this.subtitle, this.url,
      this.image, this.excerpt);

  LatestItem.fromJson(Map<String, dynamic> json)
      : row = json['row'],
        date = json['date'],
        title = json['title'],
        subtitle = json['subtitle'],
        url = json['url'],
        image = json['image'],
        excerpt = json['excerpt'];

  Map<String, dynamic> toJson() => {
        'row': row,
        'date': date,
        'title': title,
        'subtitle': subtitle,
        'url': url,
        'imagename': image,
        'excerpt': excerpt
      };
}
