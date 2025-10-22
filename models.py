from extensions import db  # ✅ import db from extensions, not app

class Student(db.Model):
    __tablename__ = 'student'
    student_id = db.Column(db.Integer, primary_key=True)
    Username = db.Column(db.String(100), unique=True, nullable=False)
    first_name = db.Column(db.String(100))
    last_name = db.Column(db.String(100))
    email = db.Column(db.String(120))
    mobile_number = db.Column(db.String(15))
    gender = db.Column(db.String(10))
    study_program = db.Column(db.String(100))
    room_no = db.Column(db.String(10))
    password = db.Column(db.String(255), nullable=False)


class Admin(db.Model):
    __tablename__ = 'admin'
    User_id = db.Column(db.Integer, primary_key=True)
    Username = db.Column(db.String(100), unique=True, nullable=False)
    Password = db.Column(db.String(255), nullable=False)
    User_type = db.Column(db.String(50))
