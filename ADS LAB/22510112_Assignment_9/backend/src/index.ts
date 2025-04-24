import app from "./app";
import dotenv from "dotenv";
import cors from "cors";
import routes from "./routes/database.routes"; // Import routes

dotenv.config();

// Enable CORS for all origins
app.use(cors());

// Use routes
app.use("/api", routes);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
