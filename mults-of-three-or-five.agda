{-# OPTIONS --guardedness #-}
module mults-of-three-or-five where

open import Data.List using (sum; filter; upTo)
open import Data.Nat
open import Data.Nat.DivMod using (_%_)
open import Data.Nat.Show using (show)
open import Data.Unit.Polymorphic.Base using (⊤)

open import Relation.Nullary using (Dec)
open import Relation.Unary.Properties using (_∪?_)

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl)

mul3? : ∀ (n : ℕ) → Dec (n % 3 ≡ 0)
mul3? x = (x % 3) ≟ 0

mul5? : ∀ (n : ℕ) → Dec (n % 5 ≡ 0)
mul5? x = (x % 5) ≟ 0

muls : ℕ → ℕ
muls x = sum (filter (mul3? ∪? mul5?) (upTo x))

muls-proof : Set
muls-proof = (muls 1000) ≡ 233168

module Main where
open import IO using (Main; run; putStrLn)
main : Main
main = run (putStrLn (show (muls 1000)))

