plugins {
    id("com.android.library")
    id("maven-publish")
}

publishing {
    publications {
        create<MavenPublication>("release") {
            groupId = "com.seblit.android.async"
            artifactId = "threadtape"
            version = "1.0.0"
            artifact(layout.buildDirectory.file("outputs/aar/app-release.aar"))
        }
    }

    repositories {
        maven {
            name = "Github_Packages"
            url = uri("https://maven.pkg.github.com/SebLit/ThreadTape")
            credentials {
                username = System.getenv("GITHUB_USERNAME")
                password = System.getenv("GITHUB_TOKEN")
            }
        }
    }
}

android {
    namespace = "com.litts.android.async"
    compileSdk = 35

    defaultConfig {
        minSdk = 24
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
}

dependencies {
    implementation("androidx.appcompat:appcompat:1.6.1")
    androidTestImplementation("androidx.test.ext:junit:1.2.1")
    androidTestImplementation("org.mockito:mockito-android:5.5.0")
    androidTestImplementation("androidx.test:runner:1.6.2")
}