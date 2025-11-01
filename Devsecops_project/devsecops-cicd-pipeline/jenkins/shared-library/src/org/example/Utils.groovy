package org.example

class Utils {
    static void log(String message) {
        println "[INFO] ${message}"
    }

    static void error(String message) {
        println "[ERROR] ${message}"
    }

    static void warn(String message) {
        println "[WARN] ${message}"
    }

    static void validateNotNull(Object obj, String name) {
        if (obj == null) {
            error("${name} must not be null")
            throw new IllegalArgumentException("${name} must not be null")
        }
    }

    static void validateNotEmpty(String str, String name) {
        if (str == null || str.trim().isEmpty()) {
            error("${name} must not be empty")
            throw new IllegalArgumentException("${name} must not be empty")
        }
    }
}