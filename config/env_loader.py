from pathlib import Path
from dotenv import dotenv_values

def get_variables():
    root_dir = Path(__file__).resolve().parent.parent
    env_path = root_dir / '.env'
    
    return dotenv_values(env_path)