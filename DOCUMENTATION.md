# CSGO Cafe - Technical Documentation

## Project Overview

CSGO Cafe is a CS:GO gambling website that allows users to bet their CS:GO items on various games. The platform consists of a frontend web interface and a backend Node.js server with Steam bot integration.

## Architecture

The project is built with the following architecture:

1. **Frontend**:
   - HTML/CSS/JavaScript
   - PHP for server-rendered pages
   - WebSocket communication with backend

2. **Backend**:
   - Node.js server
   - MongoDB database
   - Steam API integration
   - Socket.io for real-time updates

## Project Structure

```
csgocafe/
├── chat/                 # Chat system files
│   ├── chat.css          # Chat styling
│   └── chat.js           # Chat functionality
├── css/                  # Stylesheets
│   ├── style.css         # Main styling
│   └── chat.css          # Chat styling (duplicate)
├── img/                  # Images and assets
├── js/                   # JavaScript files
│   ├── libs/             # Third-party libraries
│   ├── noty/             # Notification library
│   ├── main.js           # Main frontend functionality
│   └── progressbar.js    # Progress bar library
├── support/              # Support system
│   ├── img/              # Support system images
│   ├── hesk_javascript.js # Support system functionality
│   ├── hesk_style.css    # Support system styling
│   └── index.php         # Support system entry point
├── .gitignore            # Git ignore file
├── about.php             # About page
├── client.js             # Client-side WebSocket handler
├── config.js             # Server configuration (from template)
├── config.template.js    # Configuration template
├── helper.js             # Utility functions
├── history.php           # Game history page
├── index.html            # Main entry point
├── LICENSE               # License file
├── merge-folders.ps1     # Folder merge script
├── package.json          # Node.js dependencies
├── README.md             # Project overview
├── rls.php               # Rules and terms of service
├── server.js             # Main server file
├── simple-line-icons.css # Icon font CSS
├── steambot.config.js    # Steam bot configuration (from template)
├── steambot.config.template.js # Steam bot configuration template
├── steambot.js           # Steam bot logic
└── top.php               # Top players page
```

## Setup Guide

### Prerequisites

- Node.js (v10.x or higher)
- npm (v6.x or higher)
- MongoDB server
- A dedicated Steam account for the bot
- Steam API Key
- Backpack.tf API Key

### Installation Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/csgocafe.git
   cd csgocafe
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Configure the application**:
   ```bash
   cp config.template.js config.js
   cp steambot.config.template.js steambot.config.js
   ```
   
   Edit the config files with your actual API keys, credentials, and settings.

4. **Start MongoDB**:
   Ensure MongoDB is running on your system.

5. **Start the application**:
   ```bash
   node steambot.js
   ```

### Configuration Details

#### steambot.config.js

| Setting | Description |
|---------|-------------|
| admin | Steam ID of the admin account (64-bit format) |
| sitename | Your website URL |
| feevip | Commission percentage for VIP users (0-1) |
| apiKey | Your Steam API key |
| backey | Your Backpack.tf API key |
| logOnOptions | Steam bot account credentials |
| authCode | Steam auth code (for first login) |
| minDeposite | Minimum deposit amount |
| gameDuration | Duration of games in seconds |
| usersToStart | Minimum users to start a game |
| fee | Commission percentage on winnings |

#### config.js

| Setting | Description |
|---------|-------------|
| domain | Server domain name |
| serverip | Server IP address |
| serverport | Server port |
| clientport | Client port for WebSocket |
| protocol | WebSocket protocol (ws:// or wss://) |
| heartbeattmo | Heartbeat timeout in milliseconds |

## Main Components

### 1. Steam Bot (steambot.js)

The Steam bot handles all interactions with the Steam network, including:
- Login and session management
- Trade offer sending and receiving
- Item inventory management
- Price checking via Backpack.tf API

### 2. Web Server (server.js)

The Node.js server provides:
- WebSocket API for real-time game updates
- HTTP endpoints for static content
- Game logic processing
- Database interaction

### 3. Frontend (HTML/CSS/JS)

The web interface includes:
- Game visualization
- User inventory display
- Betting interface
- Chat system
- History and statistics

## WebSocket API

The application uses WebSocket (Socket.io) for real-time communication between the client and server.

### Client → Server Events

| Event | Description |
|-------|-------------|
| 0 | Request current game state |
| 1 | Set trade link |
| 2 | Request game history |
| load-inventory | Request user inventory |
| profile | Request user profile |

### Server → Client Events

| Event | Description |
|-------|-------------|
| 0 | Game item updates |
| 2 | Game number and jackpot updates |
| end-game | Game completion with winner |
| start-game | New game started |
| history | Game history data |
| informers | Statistics updates |

## Database Schema

The application uses MongoDB with the following collections:

### Games Collection
Stores information about each game:
- Game ID
- Participants and their items
- Total value
- Winner
- Timestamp

### Users Collection
Stores user information:
- Steam ID
- Trade link
- Statistics (games played, won, total value bet)
- Last login

### Items Collection
Stores information about CS:GO items:
- Item name
- Price
- Steam market hash name
- Rarity

## Security Considerations

1. **API Keys**: Never commit actual API keys to version control
2. **Bot Account**: Use a dedicated Steam account with strong credentials
3. **Trade Offers**: Implement proper validation for all trade offers
4. **Rate Limiting**: Implement rate limiting for API endpoints
5. **Input Validation**: Validate all user inputs
6. **HTTPS**: Use HTTPS in production

## Troubleshooting

### Common Issues

1. **Steam Bot Login Failures**
   - Ensure Steam Guard is set up correctly
   - Check for IP restrictions or captchas on the account
   - Verify the authentication code

2. **Missing Items in Trades**
   - Check item availability in bot inventory
   - Verify the Backpack.tf API is responding correctly
   - Ensure item price is correctly evaluated

3. **WebSocket Connection Issues**
   - Check firewall settings
   - Verify correct ports are open
   - Check for SSL certificate issues if using secure WebSockets

## Deployment

For production deployment, consider the following:

1. Use a process manager like PM2 to keep the application running
2. Set up proper logging and monitoring
3. Use environment variables for sensitive configuration
4. Enable HTTPS for all communication
5. Set up database backups
6. Configure a reverse proxy (like Nginx) for better performance

## License and Legal

This project is licensed under the MIT License. See the LICENSE file for details.

**Important Legal Notice**: Gambling websites may be subject to various laws and regulations depending on your jurisdiction. Ensure that you comply with all applicable laws before deploying this application in a production environment. 