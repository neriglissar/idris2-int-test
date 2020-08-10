module Integers

test : (Show a)
    => (s : String)
    -> (init  : IO a)
    -> (write : a -> PrimIO (Ptr a))
    -> (read  : Ptr a -> PrimIO a)
    -> IO ()
test s init write read = do putStrLn ("====== " ++ s ++ " ======"  )
                            n <- init
                            putStrLn ("Idris: " ++ (show n))
                            ptr <- primIO $ write n
                            i <- primIO $ read ptr
                            putStrLn ("Idris: " ++ show i ++ "\n\n")

public export
lib : String -> String -> String
lib l fn = "C:" ++ fn ++ "," ++ l

-- -- Bits 64 -------

%foreign (lib "integers" "get__MAX_u64")
get__MAX_uint64 : PrimIO Bits64

%foreign (lib "integers" "write__uint64")
write__uint64 : Bits64 -> PrimIO (Ptr Bits64)

%foreign (lib "integers" "read__uint64")
read__uint64 : Ptr Bits64 -> PrimIO Bits64

-- -- Bits 32 -------

%foreign (lib "integers" "get__MAX_u32")
get__MAX_uint32 : PrimIO Bits32

%foreign (lib "integers" "write__uint32")
write__uint32 : Bits32 -> PrimIO (Ptr Bits32)

%foreign (lib "integers" "read__uint32")
read__uint32 : Ptr Bits32 -> PrimIO Bits32

-- -- Bits 16 -------

%foreign (lib "integers" "get__MAX_uint")
get__MAX_uint : PrimIO Bits16

%foreign (lib "integers" "write__uint")
write__uint : Bits16 -> PrimIO (Ptr Bits16)

%foreign (lib "integers" "read__uint")
read__uint : Ptr Bits16 -> PrimIO Bits16

-- -- Int 64 -------

%foreign (lib "integers" "get__MAX_64")
get__MAX_int64 : PrimIO Int 

%foreign (lib "integers" "write__int64")
write__int64 : Int -> PrimIO (Ptr Int)

%foreign (lib "integers" "read__int64")
read__int64 : Ptr Int -> PrimIO Int

-- -- Int 32 -------

%foreign (lib "integers" "get__MAX_32")
get__MAX_int32 : PrimIO Int

%foreign (lib "integers" "write__int32")
write__int32 : Int -> PrimIO (Ptr Int)

%foreign (lib "integers" "read__int32")
read__int32 : Ptr Int -> PrimIO Int

-- -- Int 16 -------

%foreign (lib "integers" "get__MAX_int")
get__MAX_int : PrimIO Int

%foreign (lib "integers" "write__int")
write__int : Int -> PrimIO (Ptr Int)

%foreign (lib "integers" "read__int")
read__int : Ptr Int -> PrimIO Int

bits : IO ()
bits = do putStrLn $ "Bits64: " ++ (show $ the Bits64 (fromInteger (-1)))
          putStrLn $ "Bits32: " ++ (show $ the Bits32 (fromInteger (-1)))
          putStrLn $ "Bits16: " ++ (show $ the Bits16 (fromInteger (-1)))

fun : IO ()
fun = do test "Bits 64" (pure (fromInteger (-1))) write__uint64 read__uint64
         test "Bits 32" (pure (fromInteger (-1))) write__uint32 read__uint32
         test "Bits 16" (pure (fromInteger (-1))) write__uint read__uint
  
run : IO ()
run = do test "Bits 64" (primIO get__MAX_uint64) write__uint64 read__uint64
         test "Bits 32" (primIO get__MAX_uint32) write__uint32 read__uint32
         test "Bits 16" (primIO get__MAX_uint) write__uint read__uint
         test "Int 64" (primIO get__MAX_int64) write__int64 read__int64
         test "Int 32" (primIO get__MAX_int32) write__int32 read__int32
         test "Int" (primIO get__MAX_int) write__int read__int
