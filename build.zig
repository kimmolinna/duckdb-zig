const std = @import("std");

pub fn build(b: *std.build.Builder) !void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    //const mode = b.standardReleaseOptions();
    const mode = .ReleaseSmall;

    const fastpforlib = b.addStaticLibrary("fastpforlib", null);
    fastpforlib.addIncludeDir("src/include");
    fastpforlib.addIncludeDir("third_party/concurrentqueue");
    fastpforlib.addIncludeDir("third_party/fast_float");
    fastpforlib.addIncludeDir("third_party/fastpforlib");
    fastpforlib.addIncludeDir("third_party/fmt/include");
    fastpforlib.addIncludeDir("third_party/hyperloglog");
    fastpforlib.addIncludeDir("third_party/miniparquet");
    fastpforlib.addIncludeDir("third_party/miniz");
    fastpforlib.addIncludeDir("third_party/pcg");
    fastpforlib.addIncludeDir("third_party/re2");
    fastpforlib.addIncludeDir("third_party/tdigest");    
    fastpforlib.addIncludeDir("third_party/utf8proc/include");
    fastpforlib.force_pic = true;
    fastpforlib.linkLibCpp();
    fastpforlib.setBuildMode(mode);
    fastpforlib.setTarget(target);
    fastpforlib.strip = true;
    fastpforlib.addCSourceFile("third_party/fastpforlib/bitpacking.cpp", &.{});
    fastpforlib.install();

    const fmt = b.addStaticLibrary("fmt", null);
    fmt.addIncludeDir("src/include");
    fmt.addIncludeDir("third_party/concurrentqueue");
    fmt.addIncludeDir("third_party/fast_float");
    fmt.addIncludeDir("third_party/fastpforlib");
    fmt.addIncludeDir("third_party/fmt/include");
    fmt.addIncludeDir("third_party/hyperloglog");
    fmt.addIncludeDir("third_party/miniparquet");
    fmt.addIncludeDir("third_party/miniz");
    fmt.addIncludeDir("third_party/pcg");
    fmt.addIncludeDir("third_party/re2");
    fmt.addIncludeDir("third_party/tdigest");    
    fmt.addIncludeDir("third_party/utf8proc/include");
    fmt.defineCMacro("DUCKDB_BUILD_LIBRARY",null);
    fmt.force_pic = true;
    fmt.linkLibCpp();
    fmt.setBuildMode(mode);
    fmt.setTarget(target);
    fmt.strip = true;
    fmt.addCSourceFile("third_party/fmt/format.cc", &.{});
    fmt.install();

    const hyperloglog = b.addStaticLibrary("hyperloglog", null);
    hyperloglog.addIncludeDir("src/include");
    hyperloglog.addIncludeDir("third_party/concurrentqueue");
    hyperloglog.addIncludeDir("third_party/fast_float");
    hyperloglog.addIncludeDir("third_party/fmt/include");
    hyperloglog.addIncludeDir("third_party/hyperloglog");
    hyperloglog.addIncludeDir("third_party/hyperloglog");
    hyperloglog.addIncludeDir("third_party/miniparquet");
    hyperloglog.addIncludeDir("third_party/miniz");
    hyperloglog.addIncludeDir("third_party/pcg");
    hyperloglog.addIncludeDir("third_party/re2");
    hyperloglog.addIncludeDir("third_party/tdigest");    
    hyperloglog.addIncludeDir("third_party/utf8proc/include");
    hyperloglog.force_pic = true;
    hyperloglog.linkLibCpp();
    hyperloglog.setBuildMode(mode);
    hyperloglog.setTarget(target);
    hyperloglog.strip = true;
    hyperloglog.addCSourceFiles(&.{
        "third_party/hyperloglog/hyperloglog.cpp",
        "third_party/hyperloglog/sds.cpp", 
    }, &.{});
    hyperloglog.install();

    const pg_query = b.addStaticLibrary("pg_query", null);
    pg_query.addIncludeDir("src/include");
    pg_query.addIncludeDir("third_party/concurrentqueue");
    pg_query.addIncludeDir("third_party/fast_float");
    pg_query.addIncludeDir("third_party/fastpforlib");
    pg_query.addIncludeDir("third_party/fmt/include");
    pg_query.addIncludeDir("third_party/hyperloglog");
    pg_query.addIncludeDir("third_party/libpg_query/include");
    pg_query.addIncludeDir("third_party/miniparquet");
    pg_query.addIncludeDir("third_party/miniz");
    pg_query.addIncludeDir("third_party/pcg");
    pg_query.addIncludeDir("third_party/re2");
    pg_query.addIncludeDir("third_party/tdigest");    
    pg_query.addIncludeDir("third_party/utf8proc/include");
    pg_query.force_pic = true;
    pg_query.linkLibCpp();
    pg_query.setBuildMode(mode);
    pg_query.setTarget(target);
    pg_query.strip = true;
    pg_query.addCSourceFiles(&.{
        "third_party/libpg_query/pg_functions.cpp",
        "third_party/libpg_query/postgres_parser.cpp",
        "third_party/libpg_query/src_backend_nodes_list.cpp",
        "third_party/libpg_query/src_backend_nodes_makefuncs.cpp",
        "third_party/libpg_query/src_backend_nodes_value.cpp",
        "third_party/libpg_query/src_backend_parser_gram.cpp",
        "third_party/libpg_query/src_backend_parser_parser.cpp", 
        "third_party/libpg_query/src_backend_parser_scan.cpp",
        "third_party/libpg_query/src_backend_parser_scansup.cpp",
        "third_party/libpg_query/src_common_keywords.cpp",
    }, &.{});
    pg_query.install();
   
    const miniz = b.addStaticLibrary("miniz", null);
    miniz.addIncludeDir("src/include");
    miniz.addIncludeDir("third_party/concurrentqueue");
    miniz.addIncludeDir("third_party/fast_float");
    miniz.addIncludeDir("third_party/fastpforlib");
    miniz.addIncludeDir("third_party/fmt/include");
    miniz.addIncludeDir("third_party/hyperloglog");
    miniz.addIncludeDir("third_party/miniparquet");
    miniz.addIncludeDir("third_party/miniz");
    miniz.addIncludeDir("third_party/pcg");
    miniz.addIncludeDir("third_party/re2");
    miniz.addIncludeDir("third_party/tdigest");    
    miniz.addIncludeDir("third_party/utf8proc/include");
    miniz.force_pic = true;
    miniz.linkLibCpp();
    miniz.setBuildMode(mode);
    miniz.setTarget(target);
    miniz.strip = true;
    miniz.addCSourceFile("third_party/miniz/miniz.cpp", &.{});
    miniz.install();

    const duckdb_re2 = b.addStaticLibrary("duckdb_re2", null);
    duckdb_re2.addIncludeDir("src/include");
    duckdb_re2.addIncludeDir("third_party/concurrentqueue");
    duckdb_re2.addIncludeDir("third_party/fast_float");
    duckdb_re2.addIncludeDir("third_party/fastpforlib");
    duckdb_re2.addIncludeDir("third_party/fmt/include");
    duckdb_re2.addIncludeDir("third_party/hyperloglog");
    duckdb_re2.addIncludeDir("third_party/miniparquet");
    duckdb_re2.addIncludeDir("third_party/miniz");
    duckdb_re2.addIncludeDir("third_party/pcg");
    duckdb_re2.addIncludeDir("third_party/re2");
    duckdb_re2.addIncludeDir("third_party/tdigest");    
    duckdb_re2.addIncludeDir("third_party/utf8proc/include");
    if (target.isWindows()){
        duckdb_re2.defineCMacro("_CRT_SECURE_NO_WARNINGS", null);
        duckdb_re2.defineCMacro("_SCL_SECURE_NO_WARNINGS", null);
        duckdb_re2.defineCMacro("_UNICODE", null);  
        duckdb_re2.defineCMacro("NOMINMAX", null);
        duckdb_re2.defineCMacro("STRICT", null);
        duckdb_re2.defineCMacro("UNICODE", null);
    }
    duckdb_re2.force_pic = true;
    duckdb_re2.linkLibCpp();
    duckdb_re2.setBuildMode(mode);
    duckdb_re2.setTarget(target);
    duckdb_re2.strip = true;
    duckdb_re2.addCSourceFiles(&.{
        "third_party/re2/re2/bitstate.cc",
        "third_party/re2/re2/compile.cc",
        "third_party/re2/re2/dfa.cc",
        "third_party/re2/re2/filtered_re2.cc",
        "third_party/re2/re2/mimics_pcre.cc",
        "third_party/re2/re2/nfa.cc",
        "third_party/re2/re2/onepass.cc",
        "third_party/re2/re2/parse.cc",
        "third_party/re2/re2/perl_groups.cc",
        "third_party/re2/re2/prefilter_tree.cc",
        "third_party/re2/re2/prefilter.cc",
        "third_party/re2/re2/prog.cc",
        "third_party/re2/re2/re2.cc",
        "third_party/re2/re2/regexp.cc",
        "third_party/re2/re2/set.cc",
        "third_party/re2/re2/simplify.cc",
        "third_party/re2/re2/stringpiece.cc",
        "third_party/re2/re2/tostring.cc",
        "third_party/re2/re2/unicode_casefold.cc",
        "third_party/re2/re2/unicode_groups.cc",
        "third_party/re2/util/rune.cc",
        "third_party/re2/util/strutil.cc",
    }, &.{});
    duckdb_re2.install();

    const utf8proc = b.addStaticLibrary("utf8proc", null);
    utf8proc.addIncludeDir("src/include");
    utf8proc.addIncludeDir("third_party/concurrentqueue");
    utf8proc.addIncludeDir("third_party/fast_float");
    utf8proc.addIncludeDir("third_party/fastpforlib");
    utf8proc.addIncludeDir("third_party/fmt/include");
    utf8proc.addIncludeDir("third_party/hyperloglog");
    utf8proc.addIncludeDir("third_party/miniparquet");
    utf8proc.addIncludeDir("third_party/miniz");
    utf8proc.addIncludeDir("third_party/pcg");
    utf8proc.addIncludeDir("third_party/re2");
    utf8proc.addIncludeDir("third_party/tdigest");    
    utf8proc.addIncludeDir("third_party/utf8proc/include");
    utf8proc.force_pic = true;
    utf8proc.linkLibCpp();
    utf8proc.setBuildMode(mode);
    utf8proc.setTarget(target);
    utf8proc.strip = true;
    utf8proc.addCSourceFiles(&.{
        "third_party/utf8proc/utf8proc_wrapper.cpp",
        "third_party/utf8proc/utf8proc.cpp", 
    }, &.{});
    utf8proc.install();

    const parquet_extension = b.addStaticLibrary("parquet_extension", null);
    parquet_extension.addIncludeDir("extension/parquet/include");
    parquet_extension.addIncludeDir("src/include");
    parquet_extension.addIncludeDir("third_party/concurrentqueue");
    parquet_extension.addIncludeDir("third_party/fast_float");
    parquet_extension.addIncludeDir("third_party/fastpforlib");
    parquet_extension.addIncludeDir("third_party/fmt/include");
    parquet_extension.addIncludeDir("third_party/hyperloglog");
    parquet_extension.addIncludeDir("third_party/miniparquet");
    parquet_extension.addIncludeDir("third_party/miniz");
    parquet_extension.addIncludeDir("third_party/parquet");    
    parquet_extension.addIncludeDir("third_party/pcg");
    parquet_extension.addIncludeDir("third_party/re2");
    parquet_extension.addIncludeDir("third_party/snappy");    
    parquet_extension.addIncludeDir("third_party/tdigest");    
    parquet_extension.addIncludeDir("third_party/thrift");    
    parquet_extension.addIncludeDir("third_party/utf8proc/include");
    parquet_extension.addIncludeDir("third_party/zstd/include");    
    parquet_extension.defineCMacro("DUCKDB_BUILD_LIBRARY",null);
    parquet_extension.force_pic = true;
    parquet_extension.linkLibCpp();
    parquet_extension.setBuildMode(mode);
    parquet_extension.setTarget(target);
    parquet_extension.strip = true;
    parquet_extension.addCSourceFiles(&.{
        "extension/parquet/column_reader.cpp",
        "extension/parquet/column_writer.cpp",
        "extension/parquet/parquet_metadata.cpp",
        "extension/parquet/parquet_reader.cpp",
        "extension/parquet/parquet_statistics.cpp",
        "extension/parquet/parquet_timestamp.cpp",
        "extension/parquet/parquet_writer.cpp",
        "extension/parquet/parquet-extension.cpp",
        "extension/parquet/zstd_file_system.cpp",
        "third_party/parquet/parquet_constants.cpp",
        "third_party/parquet/parquet_types.cpp",
        "third_party/snappy/snappy-sinksource.cc",
        "third_party/snappy/snappy.cc",
        "third_party/thrift/thrift/protocol/TProtocol.cpp",
        "third_party/thrift/thrift/transport/TBufferTransports.cpp",
        "third_party/thrift/thrift/transport/TTransportException.cpp",
        "third_party/zstd/common/entropy_common.cpp",
        "third_party/zstd/common/error_private.cpp",
        "third_party/zstd/common/fse_decompress.cpp",
        "third_party/zstd/common/xxhash.cpp",
        "third_party/zstd/common/zstd_common.cpp",
        "third_party/zstd/compress/fse_compress.cpp",
        "third_party/zstd/compress/hist.cpp",
        "third_party/zstd/compress/huf_compress.cpp",
        "third_party/zstd/compress/zstd_compress_literals.cpp",
        "third_party/zstd/compress/zstd_compress_sequences.cpp",
        "third_party/zstd/compress/zstd_compress_superblock.cpp",
        "third_party/zstd/compress/zstd_compress.cpp",
        "third_party/zstd/compress/zstd_double_fast.cpp",
        "third_party/zstd/compress/zstd_fast.cpp",
        "third_party/zstd/compress/zstd_lazy.cpp",
        "third_party/zstd/compress/zstd_ldm.cpp",
        "third_party/zstd/compress/zstd_opt.cpp",
        "third_party/zstd/decompress/huf_decompress.cpp",
        "third_party/zstd/decompress/zstd_ddict.cpp",
        "third_party/zstd/decompress/zstd_decompress_block.cpp",
        "third_party/zstd/decompress/zstd_decompress.cpp",
    }, &.{});
    parquet_extension.install();

    const icu_extension = b.addStaticLibrary("icu_extension", null);
    icu_extension.addIncludeDir("extension/icu/include");
    icu_extension.addIncludeDir("src/include");
    icu_extension.addIncludeDir("third_party/concurrentqueue");
    icu_extension.addIncludeDir("third_party/fast_float");
    icu_extension.addIncludeDir("third_party/fastpforlib");
    icu_extension.addIncludeDir("third_party/fmt/include");
    icu_extension.addIncludeDir("third_party/hyperloglog");
    icu_extension.addIncludeDir("third_party/miniparquet");
    icu_extension.addIncludeDir("third_party/miniz");
    icu_extension.addIncludeDir("third_party/pcg");
    icu_extension.addIncludeDir("third_party/re2");
    icu_extension.addIncludeDir("third_party/tdigest");
    icu_extension.addIncludeDir("third_party/utf8proc/include");
    icu_extension.defineCMacro("DUCKDB_BUILD_LIBRARY",null);
    icu_extension.force_pic = true;
    icu_extension.linkLibCpp();
    icu_extension.setBuildMode(mode);
    icu_extension.setTarget(target);
    icu_extension.strip = true;
    icu_extension.addCSourceFiles(&.{
        "extension/icu/icu-extension.cpp",
        "extension/icu/icu-datetrunc.cpp",
        "extension/icu/icu-makedate.cpp",
        "extension/icu/icu-collate.cpp",
        "extension/icu/icu-datepart.cpp",
        "extension/icu/icu-datesub.cpp",
        "extension/icu/icu-datefunc.cpp",
        "extension/icu/icu-dateadd.cpp",
    }, &.{});
    icu_extension.install();

    const httpfs_extension = b.addStaticLibrary("httpfs_extension", null);
    httpfs_extension.addIncludeDir("extension/httpfs/include");
    httpfs_extension.addIncludeDir("extension/icu/include");
    httpfs_extension.addIncludeDir("extension/parquet/include");
    httpfs_extension.addIncludeDir("src/include");
    httpfs_extension.addIncludeDir("third_party/concurrentqueue");
    httpfs_extension.addIncludeDir("third_party/fast_float");
    httpfs_extension.addIncludeDir("third_party/fastpforlib");
    httpfs_extension.addIncludeDir("third_party/fmt/include");
    httpfs_extension.addIncludeDir("third_party/httplib");
    httpfs_extension.addIncludeDir("third_party/hyperloglog");
    httpfs_extension.addIncludeDir("third_party/miniparquet");
    httpfs_extension.addIncludeDir("third_party/miniz");
    httpfs_extension.addIncludeDir("third_party/pcg");
    httpfs_extension.addIncludeDir("third_party/picohash");
    httpfs_extension.addIncludeDir("third_party/re2");
    httpfs_extension.addIncludeDir("third_party/tdigest");
    httpfs_extension.addIncludeDir("third_party/utf8proc/include");
    httpfs_extension.addIncludeDir("/usr/include/x86_64-linux-gnu");
    httpfs_extension.addIncludeDir("/usr/include");
    httpfs_extension.defineCMacro("DUCKDB_BUILD_LIBRARY",null);
    httpfs_extension.defineCMacro("BUILD_PARQUET_EXTENSION", "TRUE");
    httpfs_extension.defineCMacro("BUILD_ICU_EXTENSION", "ON");
    httpfs_extension.defineCMacro("BUILD_HTTPFS_EXTENSION", "ON");
    httpfs_extension.force_pic = true;
    httpfs_extension.linkLibCpp();
    httpfs_extension.setBuildMode(mode);
    httpfs_extension.setTarget(target);
    httpfs_extension.strip = true;
    httpfs_extension.addCSourceFiles(&.{
        "extension/httpfs/httpfs.cpp",
        "extension/httpfs/crypto.cpp",
        "extension/httpfs/httpfs-extension.cpp",
        "extension/httpfs/s3fs.cpp",
    }, &.{});
    httpfs_extension.install();

    var duckdb_sources = std.ArrayList([]const u8).init(b.allocator);
    var dir = try std.fs.cwd().openDir("src", .{ .iterate = true });
    var walker = try dir.walk(b.allocator);
    defer walker.deinit();
    var out: [256] u8 = undefined;

    const allowed_exts = [_][]const u8{ ".c", ".cpp", ".cxx", ".c++", ".cc" };
    while (try walker.next()) |entry| {
        const ext = std.fs.path.extension(entry.basename);
        const include_file = for (allowed_exts) |e| {
            if (std.mem.eql(u8, ext, e))
                break true;
            } else false;
        if (include_file) {
            // we have to clone the path as walker.next() or walker.deinit() will override/kill it
            const file = try std.fmt.bufPrint(&out, "src/{s}", .{entry.path}); 
            try duckdb_sources.append(b.dupe(file));
        }  
    }

//    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
//    defer arena.deinit();
//    const allocator = arena.allocator(); 
//    const result = std.ChildProcess.exec(.{
//        .allocator = allocator,
//        .argv =&[_][]const u8 {"git", "log", "-1", "--format=%h"},
//        .max_output_bytes = 1_000
//        });
//    defer allocator.free(result.stdout);
  
    const duckdb_static = b.addStaticLibrary("duckdb_static", null);  
    duckdb_static.addIncludeDir("src/include");
    duckdb_static.addIncludeDir("third_party/concurrentqueue");
    duckdb_static.addIncludeDir("third_party/fast_float");
    duckdb_static.addIncludeDir("third_party/fastpforlib");
    duckdb_static.addIncludeDir("third_party/fmt/include");    
    duckdb_static.addIncludeDir("third_party/httplib");
    duckdb_static.addIncludeDir("third_party/hyperloglog");
    duckdb_static.addIncludeDir("third_party/libpg_query/include");
    duckdb_static.addIncludeDir("third_party/miniparquet");
    duckdb_static.addIncludeDir("third_party/miniz");
    duckdb_static.addIncludeDir("third_party/pcg");
    duckdb_static.addIncludeDir("third_party/re2");
    duckdb_static.addIncludeDir("third_party/tdigest");
    duckdb_static.addIncludeDir("third_party/utf8proc/include");
    duckdb_static.addIncludeDir("extension/httpfs/include");
    duckdb_static.addIncludeDir("extension/icu/include");
    duckdb_static.addIncludeDir("extension/parquet/include");
    duckdb_static.defineCMacro("DUCKDB_BUILD_LIBRARY",null);
    duckdb_static.defineCMacro("DISABLE_DUCKDB_REMOTE_INSTALL", null);
    duckdb_static.defineCMacro("DUCKDB_SOURCE_ID", "\"last\"");
    duckdb_static.defineCMacro("DUCKDB_VERSION", "\"dev-version\"");
    duckdb_static.defineCMacro("BUILD_PARQUET_EXTENSION", "TRUE");
    duckdb_static.defineCMacro("BUILD_ICU_EXTENSION", "ON");
    duckdb_static.defineCMacro("BUILD_HTTPFS_EXTENSION", "ON");
    duckdb_static.defineCMacro("SQLITE_OMIT_LOAD_EXTENSION","1");
    duckdb_static.addCSourceFiles(duckdb_sources.items, &.{});
    duckdb_static.force_pic = true;
    duckdb_static.linkLibCpp();
    duckdb_static.setBuildMode(mode);
    duckdb_static.setTarget(target);
    duckdb_static.strip = true;
    duckdb_static.install();
    
    const duckdb = b.addSharedLibrary("duckdb",null, .unversioned);
    duckdb.defineCMacro("DUCKDB",null);
    duckdb.defineCMacro("DUCKDB_BUILD_LIBRARY",null);
    duckdb.defineCMacro("DUCKDB_MAIN_LIBRARY",null);
//    duckdb.addIncludeDir("src/include");
//    duckdb.addIncludeDir("third_party/concurrentqueue");
//    duckdb.addIncludeDir("third_party/fast_float");
//    duckdb.addIncludeDir("third_party/fastpforlib");
//    duckdb.addIncludeDir("third_party/fmt/include");    
//    duckdb.addIncludeDir("third_party/httplib");
//    duckdb.addIncludeDir("third_party/hyperloglog");
//    duckdb.addIncludeDir("third_party/libpg_query/include");
//    duckdb.addIncludeDir("third_party/miniparquet");
//    duckdb.addIncludeDir("third_party/miniz");
//    duckdb.addIncludeDir("third_party/pcg");
//    duckdb.addIncludeDir("third_party/re2");
//    duckdb.addIncludeDir("third_party/tdigest");
//    duckdb.addIncludeDir("third_party/utf8proc/include");
//    duckdb.addIncludeDir("openssl/include");
    duckdb.addIncludeDir("/usr/include/x86_64-linux-gnu");
    duckdb.addIncludeDir("/usr/include");
    duckdb.linkLibCpp();
    duckdb.linkLibrary(duckdb_re2);
    duckdb.linkLibrary(fastpforlib);
    duckdb.linkLibrary(fmt);
    duckdb.linkLibrary(duckdb_static);
    duckdb.linkLibrary(hyperloglog);
    duckdb.linkLibrary(miniz);    
    duckdb.linkLibrary(parquet_extension);
    duckdb.linkLibrary(icu_extension);
    duckdb.linkLibrary(httpfs_extension);
    duckdb.linkLibrary(pg_query);    
    duckdb.linkLibrary(utf8proc);
    duckdb.linkSystemLibrary("c");
    duckdb.linkSystemLibrary("ssl");
    duckdb.linkSystemLibrary("crypto");
    duckdb.setBuildMode(mode);
    duckdb.setTarget(target);
    duckdb.strip = true;
    duckdb.install();

    const sqlite3_api_wrapper_static = b.addStaticLibrary("sqlite3_api_wrapper_static", null);
    sqlite3_api_wrapper_static.addIncludeDir("extension");
    sqlite3_api_wrapper_static.addIncludeDir("extension/httpfs/include");
    sqlite3_api_wrapper_static.addIncludeDir("extension/icu/include");
    sqlite3_api_wrapper_static.addIncludeDir("extension/parquet/include");
    sqlite3_api_wrapper_static.addIncludeDir("src/include");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/concurrentqueue");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/fast_float");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/fastpforlib");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/fmt/include");    
    sqlite3_api_wrapper_static.addIncludeDir("third_party/hyperloglog");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/libpg_query/include");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/miniparquet");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/miniz");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/pcg");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/re2");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/tdigest");
    sqlite3_api_wrapper_static.addIncludeDir("third_party/utf8proc/include");
    sqlite3_api_wrapper_static.addIncludeDir("tools/sqlite3_api_wrapper/include");
    sqlite3_api_wrapper_static.addIncludeDir("tools/sqlite3_api_wrapper/sqlite3_udf_api/include");
    sqlite3_api_wrapper_static.addIncludeDir("tools/sqlite3_api_wrapper/sqlite3");
    sqlite3_api_wrapper_static.defineCMacro("DUCKDB_BUILD_LIBRARY",null);
    sqlite3_api_wrapper_static.defineCMacro("BUILD_PARQUET_EXTENSION", "TRUE");
    sqlite3_api_wrapper_static.defineCMacro("BUILD_ICU_EXTENSION", "ON");
    sqlite3_api_wrapper_static.defineCMacro("BUILD_HTTPFS_EXTENSION", "ON");
    sqlite3_api_wrapper_static.defineCMacro("SQLITE_SHELL_IS_UTF8", null);
    sqlite3_api_wrapper_static.linkLibrary(duckdb_static);
    sqlite3_api_wrapper_static.linkLibrary(utf8proc);
    sqlite3_api_wrapper_static.force_pic = true;
    sqlite3_api_wrapper_static.linkLibCpp();
    sqlite3_api_wrapper_static.setBuildMode(mode);
    sqlite3_api_wrapper_static.setTarget(target);
    sqlite3_api_wrapper_static.strip = true;
    sqlite3_api_wrapper_static.addCSourceFiles(&.{
        "tools/sqlite3_api_wrapper/sqlite3_api_wrapper.cpp",
        "tools/sqlite3_api_wrapper/sqlite3_udf_api/sqlite3_udf_wrapper.cpp",
        "tools/sqlite3_api_wrapper/sqlite3_udf_api/cast_sqlite.cpp",
        }, &.{});
    sqlite3_api_wrapper_static.addCSourceFile("tools/sqlite3_api_wrapper/sqlite3/printf.c", &.{});
    sqlite3_api_wrapper_static.addCSourceFile("tools/sqlite3_api_wrapper/sqlite3/strglob.c", &.{});
    if (target.isWindows()){
        sqlite3_api_wrapper_static.linkLibC();
        sqlite3_api_wrapper_static.addCSourceFile(
            "tools/sqlite3_api_wrapper/sqlite3/os_win.c", 
            &.{});
    }
    sqlite3_api_wrapper_static.install();

// shell aka DuckDBClient
    const shell = b.addExecutable("duckdb", null);
    shell.addIncludeDir("src/include");
    shell.addIncludeDir("third_party/concurrentqueue");
    shell.addIncludeDir("third_party/fast_float");
    shell.addIncludeDir("third_party/fastpforlib");
    shell.addIncludeDir("third_party/fmt/include");    
    shell.addIncludeDir("third_party/hyperloglog");
    shell.addIncludeDir("third_party/libpg_query/include");
    shell.addIncludeDir("third_party/miniparquet");
    shell.addIncludeDir("third_party/miniz");
    shell.addIncludeDir("third_party/pcg");
    shell.addIncludeDir("third_party/re2");
    shell.addIncludeDir("third_party/tdigest");
    shell.addIncludeDir("third_party/utf8proc/include");
    shell.addIncludeDir("tools/shell/include");
    shell.addIncludeDir("tools/sqlite3_api_wrapper/include");
    shell.addIncludeDir("/usr/include/x86_64-linux-gnu");
    shell.addIncludeDir("/usr/include");
    shell.defineCMacro("DUCKDB_BUILD_LIBRARY",null);
    shell.defineCMacro("BUILD_PARQUET_EXTENSION", "TRUE");
    shell.defineCMacro("BUILD_ICU_EXTENSION", "ON");
    shell.defineCMacro("BUILD_HTTPFS_EXTENSION", "ON");
    shell.defineCMacro("SQLITE_OMIT_LOAD_EXTENSION","1");
    shell.linkLibrary(duckdb_static);
    shell.linkLibrary(duckdb_re2);
    shell.linkLibrary(fastpforlib);
    shell.linkLibrary(fmt);
    shell.linkLibrary(duckdb_static);
    shell.linkLibrary(hyperloglog);
    shell.linkLibrary(miniz);    
    shell.linkLibrary(parquet_extension);
    shell.linkLibrary(icu_extension);
    shell.linkLibrary(httpfs_extension);
    shell.linkLibrary(pg_query);    
    shell.linkLibrary(utf8proc);
    shell.linkSystemLibrary("ssl");
    shell.linkSystemLibrary("crypto");
    shell.linkLibrary(sqlite3_api_wrapper_static);
    shell.setBuildMode(mode);
    shell.setTarget(target);
    shell.strip = true;
    shell.linkLibCpp();    
    shell.linkLibC();    
    shell.addCSourceFile("tools/shell/shell.c", &.{});
    if (!target.isWindows()){
        shell.linkLibCpp();
        shell.addCSourceFile(
            "tools/shell/linenoise.cpp",&.{});
        shell.defineCMacro("HAVE_LINENOISE", "1");
    }
    shell.install();
 }