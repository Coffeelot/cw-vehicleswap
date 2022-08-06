# Vehicle Swaps 🚗

![Really cool image](https://i.imgur.com/wZITWF8.png)


Script that maps vehicles and does vehicle swaps (like make a Peyote into a Peyote Gasser/Custom).
The script is QB-core based, and makes use of QB-input.

The script is more of a template than a full plug and play thing. It comes with 4 swap spots. One is at Bennys, that only does lowriders, donks and restorations, the second is up in sandy, and only does drag cars, lifted cars and restorations. Both these are set to require the player to be a mechanic to use. The third spot is a demo spot (MAKE SURE TO REMOVE THIS!) that has ALL the types. The last spot is a special spot, related to [cw-boostjob](https://github.com/Coffeelot/cw-boostjob), up in Paleto that only does special jobs. You need to legally own the car you are trying to swap... but some swaps might be a little bit more shady than others.

# Developed by Coffeelot and Wuggie 
[More scripts by us](https://github.com/stars/Coffeelot/lists/cw-scripts)  👈\
[Support, updates and script previews](https://discord.gg/FJY4mtjaKr) 👈

# Preview 📽

[![YOUTUBE VIDEO](http://img.youtube.com/vi/_EEqkvRC6RM/0.jpg)](https://youtu.be/_EEqkvRC6RM)

# Config 🔧
The script categorizes swaps into one of several types. One car can have multiple swaps (Yosemite and Peyote for example). The types are: `lowrider`, `donk`, `drag`, `resto`, `drift`, `raised`, `widebody` and `special` but of if you want to change or add types it's as easy as following the structure of the config. 

The scipt covers all Vanilla GTA cars and their swaps, but it also includes some modded ones for the special jobs: Don't worry tho, if you don't have the cars included the script will know and just not show them. 

Currently includes one demo spot (located down by Voodoo Place) that does all cars and one that demos a job-related one that only does restomods and off roaders (up in sandy)
The scrip includes a config where all swaps are defined. Wanna do a Futo to a Moster Truck? Just add it! We're planning to add other swaps also, that include illegal jobs where you steal cars and rebuild them with owned ones, that will utalize this script.

If you want to add a spot all you need to do is copy an existing one in the config and follow the template. `job` and `garage` are not requried. If you add a job, the spot will only be available to anyone with that job. If you don't add a garage name then it will default to the big red parking garage. 

# Dependencies
* qb-garages
* qb-input