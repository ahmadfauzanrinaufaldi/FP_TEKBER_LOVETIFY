import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  final List<String> tracks = [
    '"Timeless (with Playboi Carti) - The Weeknd"',
    '"Lovin\' on Me - Jack Harlow"',
    '"Not Like Us - Kendrick Lamar"',
    '"St. Chroma (feat. Daniel Caesar) - Tyler, the Creator"',
    '"Sticky (feat. GloRilla, Sexyy Red & Lil Wayne) - Tyler, the Creator"',
    '"TGIF - GloRilla"',
    '"Squabble Up - Kendrick Lamar"',
    '"Hiss - Megan Thee Stallion"',
    '"Carnival (with Ty Dolla \$ign feat. Rich the Kid & Playboi Carti) - Kanye West"',
    '"Like That (with Metro Boomin & Kendrick Lamar) - Future"',
    '"Million Dollar Baby - Tommy Richman"',
    '"Houdini - Eminem"',
    '"Act II: Date @ 8 (feat. Drake) - 4Batz"',
    '"Snooze - SZA"',
    '"Saturn - SZA"',
    '"Water - Tyla"',
    '"Made for Me - Muni Long"',
    '"Thriller - Michael Jackson"',
    '"Dreamin - PARTYNEXTDOOR"',
    '"Heart Of A Woman - Summer Walker"',
  ];

  final List<String> albums = [
    "Utopia",
    "Mr. Morale & The Big Steppers",
    "Her Loss",
    "It's Only Me",
    "Magic",
    "SOS",
    "American Dream",
    "Cowboy Carter",
    "The Year I Turned 21",
    "Being Poor Is Expensive",
    "Lungu Boy",
    "Gloria",
    "Starboy",
    "Thriller",
    "Certified Lover Boy",
    "Planet Her",
    "After Hours",
    "Good Kid, M.A.A.D City",
    "Cuz I Love You",
    "Invasion of Privacy",
  ];

  final List<String> artists = [
    "Taylor Swift",
    "The Weeknd",
    "Billie Eilish",
    "Kendrick Lamar",
    "Drake",
    "SZA",
    "Travis Scott",
    "Beyoncé",
    "Doja Cat",
    "Harry Styles",
    "Bad Bunny",
    "Olivia Rodrigo",
    "Lil Baby",
    "Kanye West",
    "Ariana Grande",
    "Ed Sheeran",
    "Justin Bieber",
    "Dua Lipa",
    "Bruno Mars",
    "Rosalía",
  ];

  final List<String> genres = ['Pop', 'Rock', 'Hip-Hop', 'Jazz', 'Classical', 'R&B', 'Electronic'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Top Songs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFF1DB954),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Tracks'),
              Tab(text: 'Artists'),
              Tab(text: 'Albums'),
              Tab(text: 'Genres'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildListView(tracks, Icons.music_note),
            _buildListView(artists, Icons.person),
            _buildListView(albums, Icons.album),
            _buildListView(genres, Icons.category),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(List<String> items, IconData icon) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF1DB954),
              child: Icon(icon, color: Colors.white),
            ),
            title: Text(
              items[index],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${items[index]} clicked'),
                  backgroundColor: Color(0xFF1DB954),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
