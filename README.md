# Secure Shared Clipboard with Google SSO

## Overview
This project implements a **secured shared clipboard** with **Google SSO authentication**, enabling users to securely copy and paste text across multiple devices while enforcing access control and data encryption.

## Features
✅ **Google SSO**: Secure authentication via OAuth2  
✅ **End-to-End Encryption**: AES-256 for clipboard data  
✅ **Access Control**: Share clipboard with specific users or teams  
✅ **Auto-Expire**: Data clears after a set time (configurable TTL)  
✅ **Audit Logs**: Track who accessed what  
✅ **Cross-Device Sync**: Real-time clipboard updates  

## Tech Stack
- **Frontend**: Angular (or React)
- **Backend**: Flask (or FastAPI)
- **Database**: Redis (for ephemeral clipboard storage), PostgreSQL (for audit logs)
- **Authentication**: Google OAuth2 via Firebase or Auth0
- **WebSockets**: For real-time clipboard synchronization

## Architecture
1. **User logs in with Google SSO** → Google OAuth2 returns JWT.
2. **Frontend requests secured clipboard access** → JWT is verified by the backend.
3. **Clipboard data is stored in Redis** (AES encrypted).
4. **Access is restricted** based on sharing permissions.
5. **Clipboard data expires** after a configurable TTL.
6. **Audit logs track copy-paste activity.**

## API Endpoints
### **Authentication**
- `POST /auth/login` → Google OAuth2 authentication
- `GET /auth/logout` → Logout user

### **Clipboard Operations**
- `POST /clipboard` → Copy text to clipboard (encrypted storage)
- `GET /clipboard` → Paste text from clipboard (with access control)
- `PUT /clipboard/share` → Share clipboard with other users

### **WebSockets for Real-Time Sync**
- `/ws/clipboard` → Real-time clipboard updates using WebSockets

## Installation & Setup
### **1. Clone the repository**
```sh
 git clone https://github.com/your-repo/secure-clipboard.git
 cd secure-clipboard
```

### **2. Setup Backend**
#### Install dependencies:
```sh
pip install -r requirements.txt
```

#### Configure environment variables:
Create a `.env` file:
```ini
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
REDIS_URL=redis://localhost:6379
JWT_SECRET_KEY=your_secret_key
```

#### Run the backend:
```sh
python app.py
```

### **3. Setup Frontend**
#### Install dependencies:
```sh
npm install
```

#### Run the frontend:
```sh
npm start
```

## Security Measures
- **AES-256 encryption** for clipboard data before storing in Redis.
- **JWT-based authentication** to secure API access.
- **Role-based access control** to manage sharing permissions.
- **Rate limiting** to prevent abuse.
- **Audit logging** for all clipboard operations.

## Future Enhancements
- **File copy-paste support**
- **Mobile app integration**
- **End-to-end encryption for shared data**

## License
This project is licensed under the MIT License.

---

**Contributors**:
- Your Name (@your-github-handle)

For questions, reach out at **your-email@example.com**.

