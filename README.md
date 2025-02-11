# Syslog + Loki + Grafana Logging Stack

## Overview
This project sets up a containerized logging stack on a Raspberry Pi to collect, store, and visualize network logs from a Ubiquiti Dream Router (UDR). It uses:
- **rsyslog** to receive logs from the UDR
- **Loki** to store and index logs
- **Grafana** to query and visualize logs

## Repository
**GitHub Repo:** [kyzersose/netlogs](https://github.com/kyzersose/netlogs)

## Features
- **Fully containerized** logging setup
- **Stores logs from the UDR** for analysis
- **Integrates with Loki and Grafana** for log management
- **Runs on Raspberry Pi** with minimal resource usage

## Setup Instructions
### Prerequisites
- A Raspberry Pi (tested on Raspberry Pi 3B+)
- Docker and Docker Compose installed
- Ubiquiti Dream Router (UDR) with syslog forwarding enabled

### Clone the Repository
```sh
git clone https://github.com/kyzersose/netlogs.git
cd netlogs
```

### Configure the UDR to Send Logs
1. Log into your UDR dashboard.
2. Navigate to **Settings** → **Advanced** → **Remote Logging**.
3. Set the Raspberry Pi's IP address as the syslog server (`192.168.1.X`).
4. Set port **514** and select **Syslog**.

### Update Docker Configuration
1. Modify `docker-compose.yml` if needed.

### Start the Containers
```sh
docker-compose up -d
```

### Verify Logs
To check if logs are being received:
```sh
docker logs syslog-server -f
```
### Access Grafana
1. Open a browser and go to `http://<raspberry_pi_ip>:3000`
2. Default credentials:
   - Username: `admin`
   - Password: `admin` (change after first login)
3. Add Loki as a data source (`http://loki:3100`).
4. Run a LogQL query:
   ```logql
   {job="syslog"}
   ```

## File Structure
```
/netlogs
├── docker-compose.yml   # Defines the container services
├── Dockerfile           # Custom rsyslog image (optional)
├── config/
│   ├── rsyslog.conf     # Rsyslog configuration
├── logs/                # Mounted log directory
└── README.md            # This documentation
```

## Future Enhancements
- Add log filtering and alerts
- Support for additional log sources
- Optimize performance for Raspberry Pi

## License
MIT License. See `LICENSE` file for details.
