/// Represents a song with its basic attributes.
class Song {
  /// Unique identifier for the song.
  final String id;

  /// Title of the song.
  final String title;

  /// Lyrics of the song.
  final String lyrics;

  /// Interpretation or translation of the song.
  final String translation;

  /// Constructor for creating a Song instance.
  ///
  /// Requires [id], [title], [lyrics], and [translation].
  const Song({
    required this.id,
    required this.title,
    required this.lyrics,
    required this.translation,
  });

  /// Converts the [Song] instance into a map for serialization.
  Map<String, String> toMap() {
    return {
      'id': id,
      'title': title,
      'lyrics': lyrics,
      'translation': translation,
    };
  }

  /// Creates a [Song] instance from a map for deserialization.
  factory Song.fromMap(Map<String, String> map) {
    return Song(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      lyrics: map['lyrics'] ?? '',
      translation: map['translation'] ?? '',
    );
  }
}
