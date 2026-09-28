# 1. Intro

Project Invicta is my dream grand strategy game. Its a character based story generator using a grand strategy framework as a base. Its core goal is giving the player the ability to play different **stories**. A **unique** story.A playthrough should be able to be used to tell a tale as **interesting** as history itself.

**Its more then a simulation but not less.**

Imagine being a character in a world that has real impact on that world in your position.

A character as a leader of a nation should impact the world differently from a player playing the head of a company.

## 2. Outline
1. Intro
2. Outline
3. Insperations
    3.1 Paradox in General
    3.2 Stellaris
    3.3 Crusader Kings 2/3
    3.4 Victoria 2/3
    3.5 X4-Foundations
    3.6 Dwarf Fortress
    3.7 Rim World
    3.8 Endless Legend 1/2

4. Engine

## 3. Insperations and their Critiques

### 3.1 Paradox in General

Paradox interactive is **the** creator of grand strategy games as a genre. I lived those games, I bathed in them every other day.

Today they are rotten to the core. They maximize profits to a degree that makes me sick. Instead of creating interesting mechanics improving the core game loop. They try to sell new minigames that are not connected to the rest of the game.

They stop improving their games and just endless iterate on them. The biggest offender would be Stellaris. Reworking mechanics like pops so many times without drastically changing their impact on the gameplay.

If they dont do this you would actually pay for an update instead of additional content.

With that sloppy releases of new games and their dlcs are just a money printer for them. They dont care...

#### Minigames

Paradox became notrious for introducing new minigames in their dlcs. What is a mini game? A minigame is a special, specific feature that is only contained for a small set of dlc related areas. That can be a **struggle/paranoia** mechanic for the soviet union or **border wars** in china.

Or the incredible bad turkish civial war mechanic. Or this or that.

They only exist for the buyers of the dlcs to think they bought content.

#### Generic Events

To hide the lack of actual content in their games they try to use a massive amount of event popups to convey the feeling that something important is always happening. Most of these event popups are not relevant. Players will be contioned to remove them as fast as possible, selecting the option with the biggest green number.

#### Event Chains

Event Chains are interesting (because they are handcrafted) but suffer from a problem. **They are interesting the first time, after that they become tedious**.

There needs to be a new way to have chains of events with interesting outcomes that are not hand crafted as a whole chain but only its parts are. So many parts can connect in different ways resulting in a unique still hand crafted chain.

Here an interesting approach could be using world states to control the flow of events so they make up a chain. Games like Kenshi have this idea where there are certain world states that impact the world.


#### The AI 

In all paradox games the AI does not know how to play their own game. There are many features the AI will not interact with because its too **buggy**, if they do regardless the player will know based on the weird AI behavior.

#### Mods

This one paradox got right, incredible fast. Mods for modern paradox games can just create dlcs. All content and many UI features can just be implemented using mods.

Just by taking a look at the mods for EU4 / HoI4 shows that modders are carrying paradox on their back.

In essence all of their elements are data driven, ui , content, etc. All defined in files you can edit using a text editor of your choice.

So its perfect? No, there is one thing it could be improved upon and that is stability. Mods break usually every patch. If we could implement a system that allows for more stability it would improve modding.

#### Multiplayer


All paradox games are locksteped simulations, there is one player as the host and its game state is the correct one. If one player diviates from it, its a **desync** and you need to reload the game save.

This is a terrible system for such a complex simulation game because as the number of players increase the number of desync that will happen grows linearly. 

A real grand strategy multiplayer games needs to have **NO DESYNCS.**


### Crusader Kings 2/3

What is the major problem between both games? CK2 is a hard simulation while CK3 is much more roleplay heavy with scripted events, minigames, etc.

Playing in China once! Playing in Japan once! and you saw everything.

In Crusader Kings 2 each system could be layered on top of each other to creating a unique set of circumstances and features that interacted in ways you wouldnt anticipate. Resuling in stories you tell others and they will never have experienced themselves. 

Played in Japan in CK3? It will be mostly the same experience I had. What different story could you tell? 

### 3.4 Victoria 3

Its economic simulation is interesting with potential, its warfare is abbysmal dog shit, hands down the worst system I have ever played. It teaches the player not to go to war.

Its political systems look deep on the surface but dont go any further. In general it has many surface systems that are not that deeply interconnected as you would expect them to be.

If you remove the ability for the player to build buildings and change their production methods there would be hardly a game left. The most tedious mirco management part of Victoria 3 is the game. Man do I love green number goes up.

### 3.7 Endless Legend 1/2

Endless Legends 1 and 2 are sooo good because they have this incredible one last turn feeling. You always get a new goal to pursure after you finished the previous one.

You always know what to do next, the ui tells all you options you have without overloading you.

Each faction you can play is good at a specific thing and giving you one big constrained what you cannot do. Maybe you cannot have more then one big city, maybe you cant have one big city but only many small ones.

Maybe you cannot use one ressource but use another already existing one more? This is much better than the problem in paradox games where unique features are not that deeply interconnected with the world itself.

It does not matter that Russia in EU4 has specific mechanics. A Poland player would not notice. You dont play Russia differently, so others dont see different behavior. In Endless Legend you see it everywhere. On the map, in their behavior, diplomacy, art, voice lines, etc.


## 4. Engine

The game engine will be split into two parts, one for the underlying simulation logic written in **Elixir** and a representation layer that actually visualizes and lets the player interact with it.

The engine will be heavily data driven so developers like modders will use the same underyling system to add new content.

```txt
// A comment explaining things...
good gold = {
    type = "rare ressource"
}
```

This is an example **placeholder** idea how it can look like adding new goods to the simulation.

### 4.1 Defining the Map as Data

You would assume defining the game map as data would look similarly as the goods example, text in file. But there is a big case it actually should look like a real map that you paint instead of write in text. 

Paradox games used this approach, but it is also important to know that the approach is powerful but needs tooling to be accesiable for modders and us a like. There pixel color decides how a province looks like and if they connect to each other. You dont need to write adjacent lists, the graph of the map is visually already inside the map file itself.

#### SVGs

We want to use SVGs with some tolerance for connections between star systems so we can draw lines between them and they auto snap to the nearest star system.

A seperate map validator module would be created and used to validate if the map is actually correct and give the user good feedback on what is wrong or right. This feedback should be possible BEFORE starting the game. We want a fast feeback loop.

Using SVGs we also get the bonus of ids we can directly give a star system an ID for example in inkscape as a name for the element. So we dont need to relay on color given.
