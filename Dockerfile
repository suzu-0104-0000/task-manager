# ベースイメージとしてEclipse TemurinのJDK 17を使用
FROM eclipse-temurin:17-jdk

# 作業ディレクトリを /app に設定
WORKDIR /app

# ビルドされた jar ファイルを /app にコピー
COPY target/task-manager-0.0.1-SNAPSHOT.jar app.jar

# アプリケーションを実行
ENTRYPOINT ["java", "-jar", "app.jar"]
