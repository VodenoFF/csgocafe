var config = {
// Admin account from which requests can come with the ability to receive items http://steamidfinder.com/ (64-bit)
"admin"           : "YOUR_STEAM_ID", 
/* Site name */    
"sitename" : "csgocafe.cf", // only your website URL
/* For VIP function to work, the user must have the same letter case in their nickname */ 
"feevip" : 0.1, // commission for VIP (from 0 to 1 decimal - percentage)
// https://steamcommunity.com/dev/apikey
"apiKey"          : "YOUR_STEAM_API_KEY",                        

  
//http://backpack.tf/api/register
"backey" :  'YOUR_BACKPACK_API_KEY',

//Dollar exchange rate [integer]
"curs" :    '60',
"admins" :    ['YOUR_STEAM_ID'],           
  
//Login and password from account [bot]                             
"logOnOptions"    : {                                    
    "accountName" : "YOUR_BOT_ACCOUNT_NAME",
    "password"    : "YOUR_BOT_PASSWORD"
},

"ssfn" : "",    
// Comes to the email on which the bot account is registered
"authCode"        : "YOUR_AUTH_CODE",
// Minimum deposit for user (rubles)
"minDeposite"     : 2,
// Game duration (sec)
"gameDuration"    : 180,
// Number of users required to start the game
"usersToStart"    : 1,
// Limit of items that a user can drop in one game
"usersItemsLimit" : 15,
// Commission on winnings (from 0 to 1 decimal - percentage)
"fee"             : 0.1,
// In history we display all items - 0, with commission - 1
"commissionHistory" : 1,
//Commission 0 - if from the entire bank, 1 - if from profit
"commissionType"  : 0,
//0 - USD, 5 - RUR (from steamapi)
"currency"        : 5,
//Commission 0 if we write without commission, 1 if with commission
"historyCommission" : 1,
//Game ID
"gameType"        : 730,
//Game duration (sec)
"bigGameDuration" : 180,
//Game delay
"bigGameDelay"    : 500,
// prefix
"gameTypeName"    : 'cs', 
//Maximum number of items per game
"bigGameItemsCount" : 100,
"simpleGameItemsCount" : 100,
//Socket port
"port" : 8080,
//Number of users to display in the top
"toplimit" :    50,
};

module.exports = config; 