# from flask import Flask, render_template
# from routes.auth_routes import auth_bp
# from routes.student_routes import student_bp
# from routes.admin_routes import admin_bp
# from routes.room_routes import room_bp

# app = Flask(__name__)
# app.config.from_object('config.Config')

# # Register blueprints
# app.register_blueprint(auth_bp)
# app.register_blueprint(student_bp)
# app.register_blueprint(admin_bp)
# app.register_blueprint(room_bp)

# @app.route('/')
# def home():
#     return render_template('login.html')

# if __name__ == '__main__':
#     app.run(debug=True)
from flask import Flask, render_template
from extensions import db   # ✅ import db from extensions, not app
from routes.auth_routes import auth_bp
from routes.student_routes import student_bp
from routes.admin_routes import admin_bp
from routes.room_routes import room_bp

app = Flask(__name__)
app.config.from_object('config.Config')
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:@localhost/hms'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db.init_app(app)  # ✅ initialize SQLAlchemy with Flask app

# Register Blueprints
app.register_blueprint(auth_bp)
app.register_blueprint(student_bp)
app.register_blueprint(admin_bp)
app.register_blueprint(room_bp)

@app.route('/')
def home():
    return render_template('login.html')

if __name__ == '__main__':
    app.run(debug=True)
