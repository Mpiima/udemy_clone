class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide(
      {required this.imageUrl, required this.title, required this.description});
}

final slideList = [
  Slide(
      imageUrl: 'landingpage_img1.jpg',
      title: 'Take Video Courses',
      description: 'From cooking to coding\nand everything in between'),
  Slide(
      imageUrl: 'landingpage_img2.png',
      title: 'Learn from the Best',
      description:
          'Approachable expert-instructors,\nvetted by 35 million learners'),
  Slide(
      imageUrl: 'landingpage_img3.jpg',
      title: 'Go at Your Own Pace',
      description: 'Lifetime access to courses,\nwatch them anytime, anywhere')
];
