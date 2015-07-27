[![Gem Version](https://badge.fury.io/rb/roguelike.svg)](http://badge.fury.io/rb/roguelike)

# Roguelike

A Rogue cloning engine written in Ruby

Roguelike is intended to be a full engine capable of running clones of the 1980 game [Rogue](https://en.wikipedia.org/wiki/Rogue_(video_game)). Users will eventually be able to simply provide a series of maps they've created and Roguelike will handle all of the logic of the game. In this way, someone who wants to create their own version of Rogue simply needs to design their dungeons, layout the enemies and treasures, and let Roguelike do the rest.

## Usage

Using Roguelike is relatively simple. In order to create your own clone of Rogue, all you need to do is create a YAML file containing all of the necessary information for the game to run.

### map.yaml

Your YAML file should contain a list of rooms (or levels) for your game, each with the following information:

Data | Description
-----|-------------
number | The number of the room, which will determine the order in which the rooms are visited
initial_x | An integer representing the x coordinate at which the player character should be drawn upon entering the room
initial_y | An integer representing the y coordinate at which the player character should be drawn upon entering the room
layout | A visual representation in ASCII characters of the room's layout

When drawing the layout, the following characters should be used to represent various parts of the map:

Character | What it Represents
----------|-------------------
`|` and `-` | Walls, which the player cannot pass through
`#`       | Doors/stairs, which will lead the player to the next room

There will be more characters available to represent other elements, such as enemies, traps, or treasure further in development. The player's character will be rendered as the `@` character based on the coordinates designed in the YAML file.

For an example of how your YAML file should be constructed, look at [example_map.yaml](https://github.com/chrisccerami/roguelike/blob/master/map_example.yaml)

Once your map is complete, you can start the program using the command:

```shell
$ roguelike run my_map.yaml
```

This will read your YAML file and start the game.

## Contributing

If you would like to contribute to Roguelike, feel free to create a
pull request. If you'd like to contact me, you can reach me at
[chrisccerami@gmail.com](mailto:chrisccerami@gmail.com) or on
Twitter [@chrisccerami](https://twitter.com/chrisccerami).

1. Fork it ( https://github.com/chrisccerami/roguelike/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright (c) 2015 Chris C Cerami

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
