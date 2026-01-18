# 1. Agresívna optimalizácia kódu
-optimizationpasses 5
-allowaccessmodification
-mergeinterfacesaggressively

# 2. Odstránenie ladiacich informácií (Logging)
# Toto odstráni volania Log.d, Log.v atď., čím sa ušetrí miesto a zrýchli beh
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# 3. Odstránenie nepotrebných atribútov
-keepattributes *Annotation*, Signature, InnerClasses, EnclosingMethod
-dontskipnonpubliclibraryclassmembers

# 4. Ochrana dôležitých častí pre Live Wallpaper
-keep public class * extends android.service.wallpaper.WallpaperService
-keep public class * extends android.service.wallpaper.WallpaperService$Engine

# 5. Ochrana pre ViewBinding (keďže ho máte v build.gradle zapnutý)
-keep class com.digitalwellbeingexperiments.toolkit.datalivewallpaper.databinding.** { *; }

# 6. Odstránenie nepoužitých Kotlin metadát
-dontwarn kotlin.**
-keep class kotlin.Metadata { *; }
-assumenosideeffects class kotlin.jvm.internal.Intrinsics {
    static void checkParameterIsNotNull(java.lang.Object, java.lang.String);
}

# 7. Zmenšenie názvov tried a metód (Obfuscation)
-repackageclasses ''
