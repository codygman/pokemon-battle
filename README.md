Pokemon Battle
===============

This was inspired by a post in /r/haskell:

http://www.reddit.com/r/haskell/comments/1zy7ut/how_would_this_program_be_implemented_in_haskell/


tl;dr I'll be emulating the following javascript code:

```haskell
// Finds random Pokémon
var hp = 200, move_count = 0;
microAjax(api_url+"/api/v1/pokemon/"+rnd(152)+"/",function(data){
    var pokemon = JSON.parse(data);
    log("Wild "+pokemon.name+" appeared!");

    // Download 4 random moves from valid moveset
    var moves = [];
    (function download_move(){
        var random_move = pokemon.moves.splice(rnd(pokemon.moves.length),1)[0];
        microAjax(api_url+random_move.resource_uri,function(data){
            moves.push(JSON.parse(data));
            if (moves.length < 4)
                download_move();
        });
    })();

    // Every 4 seconds it attacks you
    setInterval(function(){
        if (moves.length < 4 || hp <= 0) return;
        var move = moves[rnd(4)];
        var dmg = rnd(move.power*(pokemon.attack+pokemon.sp_atk)/300);
        hp -= dmg;
        move_count++;
        log(pokemon.name+" attacked you with <b>"+move.name+"</b> dealing "+dmg+" damage!");
        if (hp > 0) log("You have "+hp+" hp!");
        else log(pokemon.name+" defeated you in "+move_count+" moves.");
    },1500);
});
```

I've also come up with ideas such as making a gui client for the api which let you battle random pokemon, but we'll see how that goes.