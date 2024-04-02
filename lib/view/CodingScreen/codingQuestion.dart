import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view/CodingScreen/codingScreen.dart';

class Question extends StatefulWidget {
  final String qId;
  const Question({super.key, required this.qId});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  RxList questions = [
    {
      "id": "Q1",
      "description": "Given a string, return the reversed string.",
      "testCases": [
        {"input": "Hello, World!", "output": "!dlroW ,olleH"},
        {"input": "DSA", "output": "ASD"},
        {"input": "12345", "output": "54321"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q2",
      "description":
          "Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.",
      "testCases": [
        {"input": "[1,3,5,6], 5", "output": "2"},
        {"input": "[1,3,5,6], 2", "output": "1"},
        {"input": "[1,3,5,6], 7", "output": "4"}
      ],
      "timeConstraints": "O(log n)"
    },
    {
      "id": "Q3",
      "description":
          "Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.",
      "testCases": [
        {"input": "[2,7,11,15], 9", "output": "[0, 1]"},
        {"input": "[3,2,4], 6", "output": "[1, 2]"},
        {"input": "[3,3], 6", "output": "[0, 1]"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q4",
      "description":
          "Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.",
      "testCases": [
        {"input": "()", "output": "true"},
        {"input": "()[]{}", "output": "true"},
        {"input": "(]", "output": "false"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q5",
      "description":
          "Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.",
      "testCases": [
        {"input": "[1,2,4], [1,3,4]", "output": "[1,1,2,3,4,4]"},
        {"input": "[], []", "output": "[]"},
        {"input": "[], [0]", "output": "[0]"}
      ],
      "timeConstraints": "O(n + m)"
    },
    {
      "id": "Q6",
      "description":
          "Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.",
      "testCases": [
        {"input": "[-2,1,-3,4,-1,2,1,-5,4]", "output": "6"},
        {"input": "[1]", "output": "1"},
        {"input": "[5,4,-1,7,8]", "output": "23"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q7",
      "description":
          "You are climbing a staircase. It takes n steps to reach the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?",
      "testCases": [
        {"input": "2", "output": "2"},
        {"input": "3", "output": "3"},
        {"input": "4", "output": "5"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q8",
      "description":
          "Implement strStr(). Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.",
      "testCases": [
        {"input": "\"hello\", \"ll\"", "output": "2"},
        {"input": "\"aaaaa\", \"bba\"", "output": "-1"},
        {"input": "\"\", \"\"", "output": "0"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q9",
      "description":
          "The count-and-say sequence is a sequence of digit strings defined by the recursive formula: countAndSay(1) = '1', countAndSay(n) is the way you would 'say' the digit string from countAndSay(n-1), which is then converted into a different digit string.",
      "testCases": [
        {"input": "1", "output": "1"},
        {"input": "4", "output": "1211"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q10",
      "description":
          "Given the root of a binary tree, return its maximum depth. A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.",
      "testCases": [
        {"input": "[3,9,20,null,null,15,7]", "output": "3"},
        {"input": "[1,null,2]", "output": "2"},
        {"input": "[]", "output": "0"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q11",
      "description":
          "Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.",
      "testCases": [
        {"input": "[2,2,1]", "output": "1"},
        {"input": "[4,1,2,1,2]", "output": "4"},
        {"input": "[1]", "output": "1"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q12",
      "description":
          "Given head, the head of a linked list, determine if the linked list has a cycle in it. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.",
      "testCases": [
        {"input": "[3,2,0,-4], 1", "output": "true"},
        {"input": "[1,2], 0", "output": "true"},
        {"input": "[1], -1", "output": "false"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q13",
      "description":
          "Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.",
      "testCases": [
        {
          "input":
              "['MinStack','push','push','push','getMin','pop','top','getMin'], [[],[-2],[0],[-3],[],[],[],[]]",
          "output": "[null,null,null,null,-3,null,0,-2]"
        },
        {
          "input":
              "['MinStack','push','push','push','getMin','pop','top','getMin'], [[],[0],[1],[0],[],[],[],[]]",
          "output": "[null,null,null,null,0,null,1,0]"
        }
      ],
      "timeConstraints": "O(1)"
    },
    {
      "id": "Q14",
      "description":
          "Given the root of a binary tree, invert the tree, and return its root.",
      "testCases": [
        {"input": "[4,2,7,1,3,6,9]", "output": "[4,7,2,9,6,3,1]"},
        {"input": "[2,1]", "output": "[2,null,1]"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q15",
      "description":
          "Given an integer n, return true if it is a power of three. Otherwise, return false.",
      "testCases": [
        {"input": "27", "output": "true"},
        {"input": "0", "output": "false"},
        {"input": "9", "output": "true"}
      ],
      "timeConstraints": "O(log n)"
    },
    {
      "id": "Q16",
      "description":
          "Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.",
      "testCases": [
        {"input": "[4,3,2,7,8,2,3,1]", "output": "[5,6]"},
        {"input": "[1,1]", "output": "[2]"}
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q17",
      "description":
          "Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.",
      "testCases": [
        {"input": "[3,4,5,1,2], [4,1,2]", "output": "true"},
        {
          "input": "[3,4,5,1,2,null,null,null,null,0], [4,1,2]",
          "output": "false"
        }
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q18",
      "description":
          "Given a positive integer, check whether it has alternating bits: namely, if two adjacent bits will always have different values.",
      "testCases": [
        {"input": "5", "output": "true"},
        {"input": "7", "output": "false"},
        {"input": "11", "output": "false"}
      ],
      "timeConstraints": "O(1)"
    },
    {
      "id": "Q19",
      "description":
          "We are to write the letters of a given string S, from left to right into lines. Each line has maximum width 100 units, and if writing a letter would cause the width of the line to exceed 100 units, it is written on the next line. We are given an array widths, an array where widths[0] is the width of 'a', widths[1] is the width of 'b', ..., and widths[25] is the width of 'z'. Now answer two questions: how many lines have at least one character from S, and what is the width used by the last such line? Return your answer as an integer list of length 2.",
      "testCases": [
        {
          "input":
              "[4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], \"bbbcccdddaaa\"",
          "output": "[2, 4]"
        },
        {
          "input":
              "[10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], \"abcdefghijklmnopqrstuvwxyz\"",
          "output": "[3, 60]"
        }
      ],
      "timeConstraints": "O(n)"
    },
    {
      "id": "Q20",
      "description":
          "Given a non-empty, singly linked list with head node head, return a middle node of linked list. If there are two middle nodes, return the second middle node.",
      "testCases": [
        {"input": "[1,2,3,4,5]", "output": "[3,4,5]"},
        {"input": "[1,2,3,4,5,6]", "output": "[4,5,6]"}
      ],
      "timeConstraints": "O(n)"
    }
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${widget.qId}'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return questions[index]['id'] == widget.qId
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 5,
                          //     blurRadius: 7,
                          //     offset: Offset(0, 3),
                          //   ),
                          // ],
                        ),
                        child: Text(
                          questions[index]['description'],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      ...questions[index]['testCases'].map((testCase) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 5,
                            //     blurRadius: 7,
                            //     offset: Offset(0, 3),
                            //   ),
                            // ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Input: ${testCase['input']}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Output: ${testCase['output']}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 5,
                          //     blurRadius: 7,
                          //     offset: Offset(0, 3),
                          //   ),
                          // ],
                        ),
                        child: Text(
                          'Time Constraints: ${questions[index]['timeConstraints']}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '**Please be aware that plagiarism in code submissions will have serious consequences.**',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.to(CodingScreen(
                              questionId: widget.qId,
                            ));
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.5),
                              //     spreadRadius: 5,
                              //     blurRadius: 7,
                              //     offset: Offset(0, 3),
                              //   ),
                              // ],
                            ),
                            child: Text(
                              'Click To Solve',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
