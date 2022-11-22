from locust import HttpUser, task

class DebugUser(HttpUser):
    @task
    def debug_test(self):
        self.client.get("/api/v1/debug/test")
