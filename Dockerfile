# --- Build Stage ---
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app
COPY . .

# mvnwに実行権限を付与
RUN chmod +x mvnw

# Mavenでビルド（ローカルにmvnwがある場合は ./mvnw を使う）
RUN ./mvnw clean package -DskipTests

# --- Run Stage ---
FROM eclipse-temurin:21-jdk
WORKDIR /app

# buildステージからjarをコピー
COPY --from=build /app/target/task-manager-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
