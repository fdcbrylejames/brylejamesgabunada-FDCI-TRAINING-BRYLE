// Character prototype
function Character(name, health) {
    this.name = name;
    this.health = health;
  }
  
  // Character.prototype.printStats = function() {
  //   console.log(`${this.name} - Health: ${this.health}`);
  // };
  
  // Player constructor
  function Player(name, health, level) {
    // Call the Character constructor to inherit its properties
    Character.call( this,name, health);
    this.level = level;
  }
  
  // Set up inheritance
  Player.prototype = Object.create(Character.prototype);
  Player.prototype.constructor = Player;
  
  // Implement levelUp method for Player
  Character.prototype.levelUp = function() {
    this.level++;
    console.log(`${this.name} leveled up to level ${this.level}!`);
  };
  
  // Enemy constructor
  function Enemy(name, health) {
    Character.call(this, name, health);
  }
  
  // Set up inheritance
  Enemy.prototype = Object.create(Character.prototype);
  Enemy.prototype.constructor = Enemy;
  
  // Implement attack method for Player
  Character.prototype.attack = function(target) {
    console.log(`${this.name} attacks ${target.name}!`);
    target.health -= 10;
    console.log(`${target.name}'s health is now ${target.health}`);
  if (target.health == 0) {
      this.levelUp();
      target.health = 50;
    } 
  
  };
  
  const player = new Player("Hero", 100, 1);
  const enemy = new Enemy("Monster", 50);
  // Perform attacks, level up, etc.
  let numAttack =10;
  for(let i=0; i<numAttack;i++){
      player.attack(enemy);
  }
  
  let enemyAttack =4;
   for(let j=0; j<enemyAttack;j++){
     enemy.attack(player);
   }
  
  
  
  