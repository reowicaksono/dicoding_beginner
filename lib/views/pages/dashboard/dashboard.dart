part of '../../pages.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedCategory = 'Popular';
  final AppPreferences _preferences = AppPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // Konfigurasi SliverAppBar
              expandedHeight: 100.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                // Konfigurasi FlexibleSpaceBar
                title: Text('DICODING BEGINNER'),
              ),
            ),
          ];
        },
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    setState(() {
                      _preferences.setLoginState(false);
                    });
                  },
                ),
                IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoute.KERANJANG)),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Hello User, apa yang ingin kamu makan hari ini?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari makanan...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      // Tambahkan aksi untuk tombol filter di sini
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Rekomendasi makanan hari ini',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.only(left: 24),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildFoodCard('Makanan 1', 'Deskripsi makanan 1', 4),
                    buildFoodCard('Makanan 2', 'Deskripsi makanan 2', 3),
                    buildFoodCard('Makanan 3', 'Deskripsi makanan 3', 5),
                    // Tambahkan lebih banyak Container(Card) di sini jika diperlukan
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Popular';
                    });
                  },
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: selectedCategory == 'Popular'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Hottest';
                    });
                  },
                  child: Text(
                    'Hottest',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: selectedCategory == 'Hottest'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Top';
                    });
                  },
                  child: Text(
                    'Top',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: selectedCategory == 'Top'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.only(left: 24),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: selectedCategory == 'Popular'
                    ? buildContentWithDelay(buildPopularContent)
                    : selectedCategory == 'Hottest'
                        ? buildContentWithDelay(buildHottestContent)
                        : buildContentWithDelay(buildTopContent),
              ),
            ),
          ],
        ),
      )),
    );
  }

  FutureBuilder<void> buildContentWithDelay(Function contentBuilder) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Menampilkan indikator loading selama proses pengambilan data
          return Center(child: CircularProgressIndicator());
        } else {
          // Menampilkan data setelah proses pengambilan data selesai
          return contentBuilder();
        }
      },
    );
  }

  Widget buildFoodCard(String title, String description, int stars) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.DETAIL_ITEMS),
      child: Container(
        width: 200,
        child: Card(
          child: Column(
            children: [
              ClipRect(
                child: SizedBox(
                  height: 120, // Atur tinggi gambar sesuai kebutuhan
                  child: Image.asset(
                    '${AppConst.IMAGE_PATH}/isometric-picnic-basket.png',
                    width: 200,
                    fit:
                        BoxFit.cover, // Atur agar gambar mencakup seluruh kotak
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(description),
                    Row(
                      children: List.generate(
                        stars,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopularContent() {
    return Row(
      children: [
        buildFoodCard('Makanan 1', 'Deskripsi makanan 1', 4),
        buildFoodCard('Makanan 2', 'Deskripsi makanan 2', 3),
      ],
    );
  }

  Widget buildHottestContent() {
    // Implementasikan konten untuk kategori 'Hottest' di sini
    return Row(
      children: [
        buildFoodCard('Makanan 2', 'Deskripsi makanan 2', 3),
        buildFoodCard('Makanan 3', 'Deskripsi makanan 3', 4),
        buildFoodCard('Makanan 3', 'Deskripsi makanan 3', 4),
      ],
    );
  }

  Widget buildTopContent() {
    return Row(
      children: [
        buildFoodCard('Makanan 3', 'Deskripsi makanan 3', 4),
        buildFoodCard('Makanan 2', 'Deskripsi makanan 2', 3),
      ],
    );
  }
}
