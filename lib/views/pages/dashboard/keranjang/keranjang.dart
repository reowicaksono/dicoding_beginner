part of '../../../pages.dart';

class Keranjang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('DICODING BEGINNER'),
              background: Image.asset(
                '${AppConst.IMAGE_PATH}/isometric-picnic-basket.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.grey,
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.restaurant),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama Makanan',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Harga: \$10.00'),
                        ],
                      ),
                      Text('\$10.00',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
