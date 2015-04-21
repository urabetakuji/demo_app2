# 主人公クラス
class Player
  attr_accessor :name, :health_point, :attack
  
  def initialize
  @name="主人公"
  @health_point=10
  @attack=5
  end

  def dead?
    @health_point<=0
  end
end
  
# モンスタークラス
class Monster 
  atter_accesor :name, :health_point, :attack
  def initialize
  @name="モンスター"
  @health_point=10
  @attack=5
  end
  def dead?
    @health_point<=0
  end
end
class Battle　#戦う者を定義。攻撃を定義。判定を定義。
  def initialize
    @player=player
    @monster=monster
  end
  def attack
    damage=3
    puts @player.name + "の攻撃!! %iのダメージ"　% damage
    @player.health_point=@player.health_point-damage
    puts @monster.name + "の攻撃!! %iのダメージ"　% damage
    @monster.health_point=@monster.health_point-damage   
    puts ""
    @player.dead? or @monster.dead? #どちらかのhpがなくなったかの判定
  end  
  def judges
    if @player.dead? and @monster.dead?
      puts "相打ち・・・"
    elsif @player.dead?
      puts "モンスターの勝ち・・・"
    elsif @monster.dead?
      puts "主人公の勝ち・・・"
    end
  end  
end    
# ゲームクラス
class Game
  def start
    player=Player.new
    monster=Monster.new
    battle=Battle.new(player,monster)
    decision=false
    until decision do
      puts "----------------"
      puts "主人公%iのダメージHP:%i<-->モンスター%iのダメージ"　[player.health_point,monster.health_point]
      print "ENTERキーを押下すると実行, 3を入力すると終了 > "