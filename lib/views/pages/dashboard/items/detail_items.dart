part of '../../../pages.dart';

const mainOrange = Colors.orange;
const whiteColor = Colors.white;
const mainGreen = Colors.green;
const blackColor = Colors.black;
final BlackText = TextStyle(color: blackColor);
final WhiteText = TextStyle(color: whiteColor);

class DetailItems extends StatelessWidget {
  var currentpage = 0;
  var currentpagetabs = 0;
  var currentpagecategories = 0;

  void ChangePage(index) {
    this.currentpage = index;
  }

  void ChangePageTabs(index) {
    this.currentpagetabs = index;
  }

  void ChangePageCategories(index) {
    this.currentpagecategories = index;
  }

  List<String> deskripsi = ["Food", "Health", "History", "Color", "Dummy"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainOrange,
      body: SafeArea(
        child: Stack(
          children: [
            // Gambar
            Stack(
              children: [
                Image(
                  image: AssetImage(
                      "${AppConst.IMAGE_PATH}/isometric-picnic-basket.png"),
                  fit: BoxFit.cover,
                  height: 350,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: Image(
                    image: AssetImage(
                        "${AppConst.IMAGE_PATH}/isometric-picnic-basket.png"),
                    fit: BoxFit.cover,
                    height: 270,
                    width: 270,
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                SizedBox(
                  height: 320,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Junk Food",
                          style: BlackText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location_solid,
                              color: blackColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "United State, Minnesota",
                              style: BlackText.copyWith(
                                  fontWeight: FontWeight.w200, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              kategori(
                                  halaman: 0,
                                  url:
                                      '${AppConst.IMAGE_PATH}/isometric-picnic-basket.png',
                                  tinggi: 70,
                                  lebar: 70,
                                  warnaIcon: mainOrange,
                                  tinggiIcon: 40,
                                  lebarIcon: 40,
                                  warnaBg: mainGreen),
                              SizedBox(width: 30),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Description",
                              style: BlackText.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(width: 8),
                            Container(
                              height: 16,
                              width: 2,
                              color: blackColor,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "deskripsi",
                              style: BlackText.copyWith(
                                  fontWeight: FontWeight.w300, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          // height should be fixed for vertical scrolling
                          height: 200.0,

                          child: SingleChildScrollView(
                            // for Vertical scrolling
                            scrollDirection: Axis.vertical,
                            child: Text("data"),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Button
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * 24),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: mainOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                "Dummy Button",
                                style: WhiteText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 50,
                        width: 50,
                        child: Icon(Icons.chevron_left),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // favouriteC.changeFavouriteColor();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, top: 18),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(Icons.favorite, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column kategori({
    int halaman = 0,
    String url = '',
    double tinggi = 60,
    double lebar = 60,
    Color warnaBg = Colors.grey,
    Color warnaIcon = Colors.black45,
    double tinggiIcon = 25,
    double lebarIcon = 25,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          // onTap: () => currentC.ChangePageCategories(halaman),
          child: Container(
            height: tinggi,
            width: lebar,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: warnaBg,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: tinggiIcon,
                  width: lebarIcon,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "${AppConst.IMAGE_PATH}/isometric-picnic-basket.png"),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(warnaIcon, BlendMode.modulate),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
