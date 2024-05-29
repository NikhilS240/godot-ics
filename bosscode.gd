extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

extends CharacterBody2D

class Character:
	def __init__(self, name, health, attack_power):
		self.name = name
		self.health = health
		self.attack_power = attack_power

	def attack(self, other):
		damage = random.randint(1, self.attack_power)
		other.health -= damage
		return damage

	def is_alive(self):
		return self.health > 0

class Player(Character):
	def __init__(self, name, health, attack_power, potions):
		super().__init__(name, health, attack_power)
		self.potions = potions

	def use_potion(self):
		if self.potions > 0:
			self.health += 20
			self.potions -= 1
			print(f"{self.name} used a potion and restored 20 health points!")
		else:
			print(f"{self.name} has no potions left!")

class Boss(Character):
	def special_attack(self, other):
		damage = random.randint(self.attack_power // 2, self.attack_power * 2)
		other.health -= damage
		return damage

def boss_fight(player, boss):
	print(f"A wild {boss.name} appears!")
	
	while player.is_alive() and boss.is_alive():
		print(f"\n{player.name}: {player.health} HP, {player.potions} Potions")
		print(f"{boss.name}: {boss.health} HP")
		
		action = input(f"Choose an action: (1) Attack (2) Use Potion: ")
		
		if action == '1':
			damage = player.attack(boss)
			print(f"{player.name} attacks {boss.name} for {damage} damage!")
		elif action == '2':
			player.use_potion()
		else:
			print("Invalid action. Choose again.")
			continue

		if boss.is_alive():
			if random.random() < 0.2:  # 20% chance to use special attack
				damage = boss.special_attack(player)
				print(f"{boss.name} uses a special attack on {player.name} for {damage} damage!")
			else:
				damage = boss.attack(player)
				print(f"{boss.name} attacks {player.name} for {damage} damage!")
	
	if player.is_alive():
		print(f"\n{player.name} has defeated {boss.name}!")
	else:
		print(f"\n{player.name} was defeated by {boss.name}...")

# Example usage
player = Player(name="Hero", health=100, attack_power=15, potions=3)
boss = Boss(name="Dragon", health=120, attack_power=20)

boss_fight(player, boss)
