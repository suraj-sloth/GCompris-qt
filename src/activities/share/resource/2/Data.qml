/* GCompris - Data.qml
 *
 * Copyright (C) 2020 Shubham Mishra <email.shivam828787@gmail.com>
 *
 * Authors:
 *   shivam828787@gmail.com <email.shivam828787@gmail.com>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, see <http://www.gnu.org/licenses/>.
 */
import GCompris 1.0

Data {
    objective: qsTr( "Split a number of candies equally between kids with some extra candy left to put in jar.")
    difficulty: 5
    data:  [
        [
            {
                "instruction": qsTr("Paul wants to equally share 2 pieces of candy between 2 of his friends: one girl and one boy. Can you help him? First, place the children in center, then drag the pieces of candy to each of them."),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 1,
                "totalCandies": 2,
                "showCount": true,
                "forceShowBasket": "true",
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Now he wants to give 5 pieces of candy to his friends."),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 1,
                "totalCandies": 5,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Can you now give 7 of Paul's pieces of candy to his friends?"),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 1,
                "totalCandies": 7,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("He wants to give 8 more pieces of candy to his friends"),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 1,
                "totalCandies": 8,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Paul has only 11 pieces of candy left. He eats 2 pieces of candy and he gives the rest to his friends. Can you help him equally split the 10 remaining pieces of candy?"),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 1,
                "totalCandies": 9,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            }
        ],
        [
            {
                "instruction": qsTr("Bob wants to give 3 pieces of candy to his friends: two boys and one girl, his girlfriend already has one candy. Can you help him equally split the pieces of candy so that each friend will have the same amount of pieces of candy?"),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 1,
                "totalCandies": 3,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 1,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Harry wants to equally share 8 pieces of candy between his friends: one boy and two girls. Place the children in center, then drag the pieces of candy to each of them so that each of them has an equal number of pieces of candy."),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 2,
                "totalCandies": 9,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 1
            },
            {
                "instruction": qsTr("Can you now give 8 of Harry's pieces of candy to his friends?"),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 2,
                "totalCandies": 10,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 2
            },
            {
                "instruction": qsTr("Harry is left with 12 pieces of candy, can you share them between his friends?"),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 2,
                "totalCandies": 14,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 2
            }
        ],
        [
            {
                "instruction": qsTr("Alice wants to equally share 4 pieces of candy between 4 of her friends: two girl and two boys. Can you help her? First, place the children in the center, then drag the pieces of candy to each of them."),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 2,
                "totalCandies": 4,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Now, Alice wants to give 8 pieces of candy to her friends"),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 2,
                "totalCandies": 8,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Can you help Alice give 10 pieces of candy to her friends: one girl and three boys?"),
                "randomisedInputData": false,
                "totalBoys": 3,
                "totalGirls": 1,
                "totalCandies": 12,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 2,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Alice wants to give 16 pieces of candy to her friends"),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 2,
                "totalCandies": 16,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Alice has 14 pieces of candy left. She wants to give them all to her friends. Can you help her split the pieces of candy equally?"),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 2,
                "totalCandies": 20,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 3
            }
        ],
        [
            {
                "instruction": qsTr("Help Jon split 11 pieces of candies between three boys and two girls. The rest will remain to Jon."),
                "randomisedInputData": false,
                "totalBoys": 3,
                "totalGirls": 2,
                "totalCandies": 11,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Jon wants to share the rest of his pieces of candies with his brother and his sister. Can you split them equally, knowing that his brother already has two pieces of candies?"),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 3,
                "totalCandies": 16,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 2
            },
            {
                "instruction": qsTr("Help Tux split some pieces of candies to his friends: 19 pieces of candies to four boy and one girls."),
                "randomisedInputData": false,
                "totalBoys": 4,
                "totalGirls": 1,
                "totalCandies": 21,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 2,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Help Maria split 18 pieces of candies between three boys and two girls. The rest will remain to Jon."),
                "randomisedInputData": false,
                "totalBoys": 3,
                "totalGirls": 2,
                "totalCandies": 20,
                "showCount": false,
                "forceShowBasket": true,
                "placedInGirls": 1,
                "placedInBoys": 0
            },
        ],
        [
            {
                "instruction": qsTr("Charles wants to share his 6 pieces of candy with 2 of his friends: one boy and one girls. Can he split the pieces of candy equally?"),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 1,
                "totalCandies": 6,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("For her birthday, Elizabeth has 8 pieces of candy to share with 3 of her friends: two girls and one boys. How should she split the pieces of candy to her friends?"),
                "randomisedInputData": false,
                "totalBoys": 1,
                "totalGirls": 2,
                "totalCandies": 12,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 2,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("Jason's father gave him 17 pieces of candy to share with his friends: two boys and two girls. Help him give the pieces of candy to his friends!"),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 2,
                "totalCandies": 17,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 0
            },
            {
                "instruction": qsTr("George wants to equally share 14 pieces of candy between 4 of his friends: two girl and two boy. Can he equally split the pieces of candy between his friends? First, place the children in center, then drag the pieces of candy to each of them. Be careful, a rest will remain!"),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 2,
                "totalCandies": 20,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 2,
                "placedInBoys": 1
            },
            {
                "instruction": qsTr("Maria wants to equally share 23 pieces of candy between 5 of her friends: three girl and two boys. Can she equally split the pieces of candy between her friends? First, place the children in center, then drag the pieces of candy to each of them. Be careful, a rest will remain!"),
                "randomisedInputData": false,
                "totalBoys": 2,
                "totalGirls": 3,
                "totalCandies": 25,
                "showCount": true,
                "forceShowBasket": true,
                "placedInGirls": 0,
                "placedInBoys": 1
            }
        ]
    ]
}
