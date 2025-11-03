import 'package:flutter/material.dart';
// Import the hypothetical chat screen
import 'chats.dart';

class conversations extends StatefulWidget {
  const conversations({super.key});

  @override
  State<conversations> createState() => _ConversationsState();
}

// Data Model
class Conversation {
  final String name;
  final String lastMessage;
  final String imageUrl;

  Conversation(this.name, this.lastMessage, this.imageUrl);
}

class _ConversationsState extends State<conversations> {
  // Dummy Data for the List
  final List<Conversation> _conversations = [
    Conversation('Alice Johnson', 'Hey, how are you doing?', 'https://via.placeholder.com/150/0000FF/808080?text=A'),
    Conversation('Bob Smith', 'Did you get the files I sent?', 'https://via.placeholder.com/150/FF0000/FFFFFF?text=B'),
    Conversation('Charlie Brown', 'See you tomorrow at 10 AM.', 'https://via.placeholder.com/150/00FF00/000000?text=C'),
    Conversation('Diana Prince', 'Thanks for your help!', 'https://via.placeholder.com/150/FFFF00/000000?text=D'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),

          // Header Text (Conversations)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Conversations",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Flexible ListView to display conversation items
          Expanded(
            child: ListView.builder(
              itemCount: _conversations.length,
              itemBuilder: (context, index) {
                final conversation = _conversations[index];
                return ConversationListItem(conversation: conversation);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --- Reusable Widget for a single conversation item (MODIFIED) ---

class ConversationListItem extends StatelessWidget {
  final Conversation conversation;

  const ConversationListItem({
    super.key,
    required this.conversation,
  });

  // Function to handle navigation
  void _goToChat(BuildContext context) {
    // Navigate to the ChatScreen, passing the conversation partner's name
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          chatPartnerName: conversation.name,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // **InkWell** provides a visual tap feedback (ripple effect)
    return InkWell(
      onTap: () => _goToChat(context), // Call the navigation function on tap
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            // Profile Picture
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(conversation.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 15),

            // Conversation Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversation.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    conversation.lastMessage,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Optional: Timestamp
            const Text(
              '10:30 AM',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}