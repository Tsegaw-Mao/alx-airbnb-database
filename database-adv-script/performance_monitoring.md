# Performance Monitoring

## Overview
This document outlines the performance monitoring practices and tools implemented to ensure the backend system remains reliable, responsive, and efficient under varying loads.

## Tools Used
- **Prometheus + Grafana**: Metrics collection and dashboard visualization.
- **New Relic / Datadog (Optional)**: Application performance monitoring and error tracking.
- **Django Debug Toolbar / Express Profiler**: Local profiling and query inspection.
- **Log Management**: Centralized logging using ELK stack or CloudWatch (if hosted on AWS).

## Metrics Monitored
- **Request Throughput (RPS)**
- **Response Time (p95, p99)**
- **CPU and Memory Usage**
- **Database Query Time**
- **Error Rates (500s, 400s)**
- **Cache Hit Rate**

## Alerting
- Threshold-based alerts configured in Prometheus for:
  - High memory usage (>80%)
  - Increased 5xx error rate
  - Slow API responses (>500ms p95)

## Future Improvements
- Implement tracing (OpenTelemetry) for end-to-end request monitoring.
- Add user-defined business KPIs to dashboard (e.g., bookings per second).
