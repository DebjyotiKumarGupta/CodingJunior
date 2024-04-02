import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/view/CodingScreen/codingQuestion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxList questions = [
    {
      "id": "Q1",
      "title": "Reverse a String",
      "topics": ["Strings", "Two Pointers"]
    },
    {
      "id": "Q2",
      "title": "Binary Search",
      "topics": ["Binary Search", "Arrays"]
    },
    {
      "id": "Q3",
      "title": "Two Sum",
      "topics": ["Arrays", "Hashing"]
    },
    {
      "id": "Q4",
      "title": "Valid Parentheses",
      "topics": ["Stack"]
    },
    {
      "id": "Q5",
      "title": "Merge Two Sorted Lists",
      "topics": ["Linked List"]
    },
    {
      "id": "Q6",
      "title": "Maximum Subarray",
      "topics": ["Arrays", "Dynamic Programming"]
    },
    {
      "id": "Q7",
      "title": "Climbing Stairs",
      "topics": ["Dynamic Programming"]
    },
    {
      "id": "Q8",
      "title": "Implement strStr()",
      "topics": ["Two Pointers", "String"]
    },
    {
      "id": "Q9",
      "title": "Count and Say",
      "topics": ["String"]
    },
    {
      "id": "Q10",
      "title": "Maximum Depth of Binary Tree",
      "topics": ["Tree", "Depth-first Search"]
    },
    {
      "id": "Q11",
      "title": "Single Number",
      "topics": ["Bit Manipulation"]
    },
    {
      "id": "Q12",
      "title": "Linked List Cycle",
      "topics": ["Linked List", "Two Pointers"]
    },
    {
      "id": "Q13",
      "title": "Min Stack",
      "topics": ["Stack", "Design"]
    },
    {
      "id": "Q14",
      "title": "Invert Binary Tree",
      "topics": ["Tree"]
    },
    {
      "id": "Q15",
      "title": "Power of Three",
      "topics": ["Math"]
    },
    {
      "id": "Q16",
      "title": "Find All Numbers Disappeared in an Array",
      "topics": ["Array"]
    },
    {
      "id": "Q17",
      "title": "Subtree of Another Tree",
      "topics": ["Tree"]
    },
    {
      "id": "Q18",
      "title": "Binary Number with Alternating Bits",
      "topics": ["Bit Manipulation"]
    },
    {
      "id": "Q19",
      "title": "Number of Lines To Write String",
      "topics": ["String"]
    },
    {
      "id": "Q20",
      "title": "Middle of the Linked List",
      "topics": ["Linked List"]
    }
  ].obs;
  RxInt indexing = 0.obs;
  final List<String> imagePaths = [
    'assets/motive1.png',
    'assets/motive2.png',
    'assets/motive3.png',
  ]; // List of image paths

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/homeIcon.png", height: 25),
            Text(
              "𝓒𝓸𝓭𝓲𝓷𝓰 𝓙𝓾𝓷𝓲𝓸𝓻",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: imagePaths.map((imagePath) {
              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                indexing.value = index;
                print(indexing.value);
              },
              height: 200, // Set the height of the carousel
              viewportFraction: 1.0, // Display one image at a time
              autoPlay: true, // Auto-play the carousel
              autoPlayInterval: Duration(seconds: 3), // Interval between slides
              autoPlayAnimationDuration:
                  Duration(milliseconds: 800), // Animation duration
              pauseAutoPlayOnTouch: true, // Pause auto-play on touch
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imagePaths.length, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: indexing.value == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }),
            );
          }),
          Text(
            "Problems",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              // color: grey,
              // fontFamily: inter,
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: questions.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.5),
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.green[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Text(
                                questions[index]["title"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: questions[index]["topics"].length,
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.purple[100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Text(questions[index]["topics"][i]),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(Question(
                              qId: questions[index]["id"],
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text(
                                  "Click to Solve",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
