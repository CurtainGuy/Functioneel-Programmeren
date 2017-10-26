-- | This module contains the data types
--   which represent the state of the game
module Model where
  
import System.IO
import Graphics.Gloss.Game

data InfoToShow = ShowNothing
                | ShowANumber Int
                | ShowAChar   Char
                | ShowAPic    FilePath

nO_SECS_BETWEEN_CYCLES :: Float
nO_SECS_BETWEEN_CYCLES = 5


data GameState = GameState {
                   infoToShow  :: InfoToShow
                 , elapsedTime :: Float
                 }

initialState :: GameState
initialState = GameState ShowNothing 0

data Gamestate = MainMenu | InGame | Paused | GameOver

data PosDir = PosDir {position :: Point, direction :: Vector}
data Player = Player {playerPD :: PosDir, weapon :: Weapon, status :: Status}
data Enemy = Enemy {enemyPD :: PosDir, enemyType :: EnemyType, rank :: Int, score :: Int}

data Status   = Alive | Dead

data Weapon = Gun  
            | RPG {ammo :: Int}
            | Shotgun {ammo :: Int}

data EnemyType  = Walker
                | Runner
                | Jumper
                | Charger
                | Flyer
                | Shooters 
                | Boss

data Enemydrop  = Healthpack {amount :: Int}
                | Ammo {amount :: Int}
                | Nothing -- If this serves no purpose, remove it.

data Block = Block {blockType : BlockType, blockPos :: GridPosition}

type GridPosition = (Int, Int)

type Row = [Block]
type Grid = [Row]

data BlockType  = Solid 
                | Platform
                | Spike
                | Spawnpoint
                | PlayerSpawnpoint

data Direction = Up | Down | Left | Right

data Projectile = Bullet {bulletDir :: Direction}
                | Missile {missileDir :: Direction}
                | Ball {ballPD :: PosDir}