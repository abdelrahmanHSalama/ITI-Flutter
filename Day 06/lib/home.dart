import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold();
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MyAppBody(),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold)),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_hunt_m_256x256.jpg"),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
          },
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
          },
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MyAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(8, (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyAvatar(),
            )),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_tcph_elrubio.jpg",
                senderName: "Abdelrahman",
                message: "Just finished work! What’s up?",
                time: "9:15 AM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_tcph_keinemusik_rampa.jpg",
                senderName: "Omar",
                message: "Let’s grab a coffee later!",
                time: "11:30 AM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_afterhours_taleofus1_256x256.jpg",
                senderName: "Ali",
                message: "Did you check out the new update?",
                time: "2:45 PM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/gtaonline_art_jumper_256.jpg",
                senderName: "Ahmed",
                message: "See you at the gym later?",
                time: "5:00 PM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_hunt_f_256x256.jpg",
                senderName: "Mohamed",
                message: "Can you send me the documents?",
                time: "8:20 PM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_tcph_elrubio.jpg",
                senderName: "Abdelrahman",
                message: "Just finished work! What’s up?",
                time: "9:15 AM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_tcph_keinemusik_rampa.jpg",
                senderName: "Omar",
                message: "Let’s grab a coffee later!",
                time: "11:30 AM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_afterhours_taleofus1_256x256.jpg",
                senderName: "Ali",
                message: "Did you check out the new update?",
                time: "2:45 PM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/gtaonline_art_jumper_256.jpg",
                senderName: "Ahmed",
                message: "See you at the gym later?",
                time: "5:00 PM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_hunt_f_256x256.jpg",
                senderName: "Mohamed",
                message: "Can you send me the documents?",
                time: "8:20 PM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_tcph_elrubio.jpg",
                senderName: "Abdelrahman",
                message: "Just finished work! What’s up?",
                time: "9:15 AM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_tcph_keinemusik_rampa.jpg",
                senderName: "Omar",
                message: "Let’s grab a coffee later!",
                time: "11:30 AM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_afterhours_taleofus1_256x256.jpg",
                senderName: "Ali",
                message: "Did you check out the new update?",
                time: "2:45 PM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/gtaonline_art_jumper_256.jpg",
                senderName: "Ahmed",
                message: "See you at the gym later?",
                time: "5:00 PM",
              ),
              MessageCard(
                imageUrl: "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/v_hunt_f_256x256.jpg",
                senderName: "Mohamed",
                message: "Can you send me the documents?",
                time: "8:20 PM",
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class MyAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundImage: NetworkImage(
        "https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/downloads/buddyiconsconavatars/gtavc_vrock_256x256.jpg",
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String imageUrl;
  final String senderName;
  final String message;
  final String time;

  MessageCard({
    Key? key,
    required this.imageUrl,
    required this.senderName,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      senderName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      time,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  message,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}