from typing import Optional

from app.models.domain.rwmodel import RWModel


class Profile(RWModel):
    username: str
    bio: str = ""
    image: Optional[str] = None
    following: bool = False
    articles_count: int = 0
