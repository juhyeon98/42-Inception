# 📦 Inception

Inception은 Docker/Docker Compose를 사용하여 NGINX, WordPress, MariaDB로 구성된 독립적인 웹 서비스 환경을 구축하는 시스템 관리 프로젝트입니다.
이 프로젝트는 **42 Seoul 커리큘럼**의 일환으로, 시스템 가상화, 컨테이너 오케스트레이션, 그리고 네트워크 구성을 깊이 있게 이해하는 것을 목표로 합니다.

## 🎯 프로젝트 목표 (Goals)
- **Docker Image Pull 금지**: 모든 서비스는 Dockerfile을 통해 Alpine Linux 기반으로 직접 빌드합니다.
- **서비스 구성**:
  - **NGINX**: TLS/SSL기반의 HTTPS 통신.
  - **WordPress**: PHP-FPM을 통해 동작하는 CMS.
  - **MariaDB**: WordPress 데이터를 저장하는 데이터베이스.
- **Docker Compose**: 독립된 컨테이너 간의 네트워크 연결 및 볼륨 관리.

## ✨ 주요 기능 (Features)
- **보안 연결**: Openssl을 이용한 Self-signed 인증서 발급 및 HTTPS 접속 지원.
- **자동화된 설정**: `.env` 환경 변수를 통해 DB 및 WordPress 초기 설정 자동화.
- **데이터 영속성**: Docker Volume을 사용하여 컨테이너가 삭제되어도 데이터 유지.
- **편리한 제어**: `Makefile`을 통한 통합 빌드 및 제어 시스템.

## 🔧 컨테이너 아키텍처 (Container Architecture)
### NGINX
- `debian:11.0`을 기반으로 빌드됩니다.
- **리버스 프록시** 역할을 수행하며, `HTTPS (port 443)` 요청을 받아 WordPress 컨테이너로 전달합니다.
- `openssl`을 사용하여 **TLSv1.3** 방식의 자체 서명 인증서를 생성함으로써 암호화된 통신을 보장합니다.
- 정적 파일을 처리하고, 동적 PHP 요청은 `fastcgi`를 통해 WordPress의 `PHP-FPM`으로 전달합니다.

### WordPress
- `debian:11.0`을 기반으로 빌드됩니다.
- **콘텐츠 관리 시스템 (CMS)**으로, `PHP-FPM`을 통해 PHP 코드를 실행합니다.
- `wp-cli` (WordPress Command-line Interface)를 사용하여 WordPress 설치, 데이터베이스 및 관리자 설정을 자동화합니다.
- 사용자 데이터, 게시물 등 모든 콘텐츠는 MariaDB 데이터베이스에 저장됩니다.

### MariaDB
- `debian:11.0`을 기반으로 빌드됩니다.
- WordPress 사이트의 데이터를 저장하고 관리하는 **데이터베이스 서버**입니다.
- `init.sql` 스크립트를 통해 WordPress용 데이터베이스와 사용자를 초기화합니다.

## ⚙️ 환경 변수 설정 (.env)
프로젝트 루트 디렉토리에 `.env` 파일을 생성하여 아래 변수들을 설정해야 합니다. 이 파일은 `docker-compose.yml`에 의해 각 서비스 컨테이너의 환경 변수로 주입되어 초기 설정을 자동화하는 데 사용됩니다.

| 변수명 | 설명 | 사용되는 서비스 |
| :--- | :--- | :--- |
| `DB_NAME` | WordPress 데이터를 저장할 데이터베이스의 이름입니다. | `mariadb`, `wordpress` |
| `DB_USER` | 데이터베이스에 접근할 사용자 이름입니다. | `mariadb`, `wordpress` |
| `DB_PASSWORD` | 데이터베이스 사용자의 비밀번호입니다. | `mariadb`, `wordpress` |
| `DB_HOST` | WordPress가 연결할 MariaDB 컨테이너의 호스트 주소입니다. (e.g., `mariadb`) | `wordpress` |
| `DB_PREFIX` | WordPress 데이터베이스 테이블의 접두사입니다. (e.g., `wp_`) | `wordpress` |
| `WP_URL` | WordPress 사이트의 전체 주소입니다. (e.g., `https://juhyelee.42.fr`) | `wordpress` |
| `WP_TITLE` | WordPress 사이트의 제목입니다. | `wordpress` |
| `WP_ADMIN` | WordPress 관리자 계정의 이름입니다. | `wordpress` |
| `WP_EMAIL` | WordPress 관리자 계정의 이메일 주소입니다. | `wordpress` |
| `WP_PASSWORD` | WordPress 관리자 계정의 비밀번호입니다. | `wordpress` |
| `TLS_CERT_PATH` | NGINX 컨테이너 내에 생성될 TLS 인증서의 전체 경로입니다. | `nginx` |
| `TLS_KEY_PATH` | NGINX 컨테이너 내에 생성될 TLS 개인 키의 전체 경로입니다. | `nginx` |

**참고**: `docker-compose.yml`에서 `HOME` 환경 변수를 사용하여 호스트 머신에 데이터 볼륨을 마운트합니다. 이는 컨테이너가 삭제되어도 데이터가 영구적으로 보존되도록 합니다.

## 🚀 Getting Stared
### 시스템 요구 사항
- Docker Engine & Docker Compose
- GNU Make
- Virtual Machine (Debian/Ubuntu 권장)

### 설치 및 실행
1. 저장소 클론
```bash
git clone https://github.com/juhyeon98/42-Inception.git
```

2. 빌드(이미지 생성)
```bash
make build
```

3. 실행
- 모든 서비스를 빌드하고 실행
```bash
make up
```
- 빌드된 이미지가 있는 경우 서비스를 시작
```bash
make start
```

4. 접속
- `https://juhyelee.42.fr` 혹은 `.env` 파일에 설정된 `WP_URL` 로 접속하면 WordPress 사이트를 확인할 수 있습니다.

5. 서비스 종료 및 이미지 제거
```bash
make down
```

6. 데이터 영구 삭제
```bash
make clean
```
(**주의 : 호스트 머신에 저장된 모든 데이터를 삭제합니다.**)


