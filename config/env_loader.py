import os
from pathlib import Path

import yaml
from dotenv import dotenv_values


def get_variables(env=None):
    root_dir = Path(__file__).resolve().parent.parent
    env = env or os.environ.get("ENV", "dev")

    env_dir = root_dir / "config" / "environments"

    config_path = None
    for ext in ("yaml", "yml"):
        candidate = env_dir / f"{env}.{ext}"
        if candidate.exists():
            config_path = candidate
            break
    if config_path is None:
        raise FileNotFoundError(
            f"Environment configuration '{env}' not found in {env_dir} (tried {env}.yaml and {env}.yml)"
        )

    with open(config_path, encoding="utf-8") as f:
        variables = yaml.safe_load(f) or {}

    env_path = root_dir / ".env"
    if env_path.exists():
        variables.update(dotenv_values(env_path))

    return variables