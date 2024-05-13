import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List myData = [
    {
      'image':
          'https://images.pexels.com/photos/6995886/pexels-photo-6995886.jpeg',
      'title': 'Pullover',
      'color': 'Black',
      'size': 'S',
      'price': 90
    },
    {
      'image':
          'https://images.pexels.com/photos/4066293/pexels-photo-4066293.jpeg',
      'title': 'T Shirt',
      'color': 'Red',
      'size': 'L',
      'price': 80
    },
    {
      'image':
          'https://images.pexels.com/photos/2723623/pexels-photo-2723623.jpeg?',
      'title': 'saree',
      'color': 'Blue',
      'price': 140
    },
  ];
  int final_cost = 0;
  List<int> total_cost = [0, 0, 0];
  List count = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  color: Colors.lightBlue,
                  size: 30,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Bag',
                  style: TextStyle(
                      fontSize: 34,
                      color: Color.fromRGBO(34, 34, 34, 1),
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: myData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Container(
                                  width: 90,
                                  child: Image.network(
                                    '${myData[index]['image']}',
                                    fit: BoxFit.cover,
                                  )),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${myData[index]['title']}'),
                                  Row(
                                    children: [
                                      const Text("Color : "),
                                      Text(
                                        '${myData[index]['color']}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text("Size : "),
                                      ),
                                      Text('${myData[index]['size']}',
                                          style: const TextStyle(
                                              color: Colors.grey)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              count[index]--;
                                              if (count[index] < 0) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'You can not go less than zero mate!')));
                                                count[index] = 0;
                                              } else {
                                                total_cost[index] =
                                                    count[index] *
                                                        myData[index]['price'];
                                              }
                                            });
                                          },
                                          child: const Center(
                                            child: Icon(
                                              Icons.remove,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text('${count[index]}'),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              count[index]++;
                                              total_cost[index] = count[index] *
                                                  myData[index]['price'];
                                            });
                                          },
                                          child: const Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.more_vert),
                                  Text("\$${myData[index]['price']}")
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Amount :'),
                          Text('\$${calculate_total_cost()}'),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'Congratulations!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Text(
                                        "You have added \n"
                                        "${count[0]} ${myData[0]['title']}"
                                        "\n${count[1]} ${myData[1]['title']}"
                                        "\n${count[2]} ${myData[2]['title']}"
                                        "\n You Total cost is \$${calculate_total_cost()}",
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: [
                                        Container(
                                          width: double.maxFinite,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.redAccent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30))),
                                            child: const Text('OKAY'),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text('CHECKOUT'),
                            )),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  int calculate_total_cost() {
    final_cost = 0; // Reset the total cost before recalculating
    for (int a in total_cost) {
      final_cost += a;
    }
    return final_cost;
  }
}
