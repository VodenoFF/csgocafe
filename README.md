# CSGO Cafe

A CS:GO gambling platform that allows users to bet their CS:GO items on various games. The platform features a modern web interface and real-time game updates.

## Features

- Real-time CS:GO item betting
- Live chat system
- Game history tracking
- User statistics and leaderboards
- Steam bot integration for item trading
- Support system for user assistance

## Prerequisites

- Node.js (v10.x or higher)
- npm (v6.x or higher)
- MongoDB server
- A dedicated Steam account for the bot
- Steam API Key
- Backpack.tf API Key

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/csgocafe.git
   cd csgocafe
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure the application:
   ```bash
   cp config.template.js config.js
   cp steambot.config.template.js steambot.config.js
   ```
   
   Edit the config files with your actual API keys, credentials, and settings.

4. Start MongoDB:
   Ensure MongoDB is running on your system.

5. Start the application:
   ```bash
   node steambot.js
   ```

## Project Structure

```
csgocafe/
├── chat/                 # Chat system files
├── css/                  # Stylesheets
├── img/                  # Images and assets
├── js/                   # JavaScript files
├── support/              # Support system
├── server.js            # Main server file
├── steambot.js          # Steam bot logic
└── [other config files]
```

## Configuration

The application requires two main configuration files:

1. `config.js` - Server configuration
2. `steambot.config.js` - Steam bot configuration

See `DOCUMENTATION.md` for detailed configuration options.

## Documentation

For detailed documentation, including:
- Architecture overview
- API documentation
- Database schema
- Security considerations
- Troubleshooting guide
- Deployment instructions

Please refer to `DOCUMENTATION.md`.

## License

This project is licensed under the terms included in the `LICENSE` file.

## Security

- Never commit actual API keys to version control
- Use a dedicated Steam account with strong credentials
- Implement proper validation for all trade offers
- Use HTTPS in production
- Follow security best practices outlined in documentation

## Support

For support, please use the built-in support system or create an issue in the repository.

