import os

from datetime import datetime, timedelta
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import scoped_session, sessionmaker

from dotenv import load_dotenv
load_dotenv()

DATABASE_URI = os.environ.get("DATABASE_URI")

engine = create_engine(DATABASE_URI, convert_unicode=True)

db_session = scoped_session(sessionmaker(autocommit=False,
                                         autoflush=False,
                                         bind=engine))
Base = declarative_base()
Base.query = db_session.query_property()


def init_db():

    from models import Post
    Base.metadata.drop_all(bind=engine)
    Base.metadata.create_all(bind=engine)

    first_post = Post(description=" Que lugar legal para postar meus artigos técnicos!",
                      created_by="Jefferson Valente", created_at=datetime.today() - timedelta(days=1))

    second_post = Post(description=" Ainda aprendendo o que postar.",
                       created_by="Jefferson Valente", created_at=datetime.today())

    db_session.add(first_post)
    db_session.add(second_post)

    db_session.commit()
