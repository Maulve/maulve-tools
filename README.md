# Maulve Tools

**A small library for Godot 4**

## What is **Maulve Tools**?

**Maulve Tools** is a small library of Scripts and Nodes. It is supposed to help your create your
game. **Maulve Tools** is based on [Nodot by krazyjakee](https://github.com/NodotProject/nodot), and is a more
cutdown and reworked version of it.


## Setup

Asset Lib Addon coming soon*

OR

1. Create an `addons` folder in the root of your project directory if one doesn't exist
2. Download the  `addons/maulve-tools` folder from this repository
3. In Godot, open Project Settings > Plugins > enable Maulve Tools

## Docs

### SaveSystem usage

To set a property to be saved, add a `Saver` node as a child of your target node.                
Then, anywhere in the Project call `SaveManager.save(slot: int = 0)`.            
(Do NOT use `$Saver.save()` as it is just utility for the SaveManager)

To load your save, call `SaveManager.load(slot: int = 0, reload_scene: bool = false)`.            
(Here you can use `$Saver.load()`, but expect it to not work properly as it's also utility for the SaveManager)


